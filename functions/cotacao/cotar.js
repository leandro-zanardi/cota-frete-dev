const functions = require('firebase-functions')

exports.cotar = functions.database
  .ref('/cotacao/{uid}/points')
  .onWrite( (event, context) => {

    //{"uid":{"points":{"A":{"lat":0, "lng":0}, "B":{"lat":0, "lng":0} } } }

      const uid = context.params.uid

      console.log("call");

      console.log(uid);

      const register = event.after.val()
      console.log(register);

      const root = event.after.ref.parent.child("valor")

     return  root.set(11.0)

});