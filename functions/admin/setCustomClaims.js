const functions = require('firebase-functions');
const firebaseAdmin = require('firebase-admin');

firebaseAdmin.initializeApp();


exports.setCustomClaims = functions.https.onRequest( async (req, res) => {
    // Get the ID token passed.
    const uid = req.body.idToken;
    console.log('setCustomClaims');
    console.log(uid);
    const claims = await firebaseAdmin.auth();

    await firebaseAdmin.auth().setCustomUserClaims(uid, {
        admin: true
    });
  
    // Tell client to refresh token on user.
    res.end(JSON.stringify({
    status: 'success'
    }));

});