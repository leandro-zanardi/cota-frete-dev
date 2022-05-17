const functions = require('firebase-functions');
const firebaseAdmin = require('firebase-admin');

exports.listAllUsers = functions.https.onRequest(async (req, res) => {
  // Get the ID token passed.
  const token = req.headers["authorization"];
  const nextPageToken = req.query["nextPageToken"];
  console.log(`admin jwt -> ${token}`);

  if (token != null && token != "") {

    try {

      let claims = await firebaseAdmin.auth()
        .verifyIdToken(token, true);

      console.log("USER CLAIMNS")
      console.log(claims)

      if (claims.admin === true) {


        let users = [];
        let pageToken = null;

        //TODO
        firebaseAdmin.auth()
          .listUsers(1000, nextPageToken)
          .then((listUsersResult) => {
            listUsersResult.users.forEach((userRecord) => {
              //console.log('user', userRecord.toJSON());
              users.push(userRecord.toJSON());
            });
            pageToken = listUsersResult.pageToken;

            
            res.end(JSON.stringify({
              error: false,
              status: 'fetch',
              users_data: {
                users: users.map((u) => { return {"uid": u.uid, "email": u.email, "customClaims": u.customClaims};}),
                pageToken: pageToken}, 
              code: 200
            }));


          })
          .catch((error) => {
            console.log('Error listing users:', error);
            res.end(JSON.stringify({
              error: error,
              status: 'Error listing users',
              code: 500
            }));
          });


      } else {
        res.end(JSON.stringify({
          error: true,
          status: 'permission denied',
          code: 303
        }));
      }

    } catch (e) {
      console.log(e);
      res.end(JSON.stringify({
        error: true,
        status: 'server side error',
        code: 500,
        exception: e
      }));
    }

  } else {
    console.log(req.headers);
    console.log(token);


    res.end(JSON.stringify({
      error: true,
      status: 'invalid parameters',
      code: 440
    }));
  }

});