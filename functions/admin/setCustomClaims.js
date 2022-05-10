const functions = require('firebase-functions');
const firebaseAdmin = require('firebase-admin');

firebaseAdmin.initializeApp();


exports.setCustomClaims = functions.https.onRequest( async (req, res) => {
    // Get the ID token passed.
    const uid = req.body.idToken;
    const isAdmin = req.body.isAdmin;
    console.log(`setCustomClaims para id -> ${uid}`);
    console.log(`eh admin? -> ${isAdmin}`);

    if (uid != null && isAdmin !== null) {

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
            status: 'fail',
            code: 404
            }));
    }

});