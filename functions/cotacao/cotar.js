const functions = require('firebase-functions')

exports.cotar = functions.database
  .ref('/cotacao/{uid}/cotacaoTime')
  .onWrite( (event, context) => {

    //{"uid":{"points":{"A":{"lat":0, "lng":0}, "B":{"lat":0, "lng":0} } } }

      const uid = context.params.uid

      console.log("call");

      //console.log(uid);

      const points =event.after.ref.parent.child("points").get().then((s) => console.log(s.val()));
      

      const root = event.after.ref.parent.child("valores")

     return  root.set(
       [
         {
           "fid": "1",
           "nome": "fornecedor 1",
           "preco": 20.0
         },
         {
          "fid": "2",
          "nome": "fornecedor 2",
          "preco": 21.0
          },
          {
            "fid": "3",
            "nome": "fornecedor 3",
            "preco": 22.0
          },
          {
            "fid": "4",
            "nome": "fornecedor 4",
            "preco": 23.0
          },
       
        ]
       
      )


});