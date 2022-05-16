const functions = require('firebase-functions');
const firebaseAdmin = require('firebase-admin');

exports.setCustomClaims = functions.https.onRequest( async (req, res) => {
    // Get the ID token passed.
    const uid = req.body.idToken;
    const isAdmin = req.body.isAdmin;
    const token = req.headers["authorization"];
    console.log(`setCustomClaims para id -> ${uid}`);
    console.log(`eh admin? -> ${isAdmin}`);
    console.log(`admin jwt -> ${token}`);

    if (uid != null && isAdmin !== null && token != null && token != "") {

        try {

            let claims = await firebaseAdmin.auth()
            .verifyIdToken(token, true);

            console.log("USER CLAIMNS")
            console.log(claims)

            if (claims.admin === true) {
                await firebaseAdmin.auth().setCustomUserClaims(uid, {
                    admin: isAdmin
                });

                // Tell client to refresh token on user.
                res.end(JSON.stringify({
                    status: 'success',
                    code: 200
                }));
            } else {
                res.end(JSON.stringify({
                    status: 'permission denied',
                    code: 303
                }));
            }
        
        } catch(e) {
            console.log(e);
            res.end(JSON.stringify({
                status: 'server side error',
                code: 500,
                exception: e
            }));
        }
        
    } else {
        console.log(req.headers);
        console.log(token);


        res.end(JSON.stringify({
            status: 'invalid parameters',
            code: 440
        }));
    }

});