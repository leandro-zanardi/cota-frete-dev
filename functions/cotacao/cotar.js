const functions = require('firebase-functions')

exports.cotar = functions.database
  .ref('/cotacao/{uid}/cotacaoTime')
  .onWrite((event, context) => {

    //{"uid":{"points":{"A":{"lat":0, "lng":0}, "B":{"lat":0, "lng":0} } } }

    const uid = context.params.uid

    console.log("call");

    //console.log(uid);

    const points = event.after.ref.parent.child("points").get().then(
      (s) => {

        if (s && s.val()) {
          
          console.log(s.val());

          const root = event.after.ref.parent.child("valores")

          var cotacoes = []
          for(let x=1; x<5; x++){
            let fornecedor = {
              "fid": x,
              "nome": "fornecedor " + x,
              "preco": Number((Math.random() * 100).toFixed(2))
            }
            cotacoes.push(fornecedor)
          }

          return root.set(cotacoes)

        } else {
          console.log("sem pontos")
          return 0;
        }

      });





  });