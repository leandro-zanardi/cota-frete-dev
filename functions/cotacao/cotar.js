const functions = require('firebase-functions')

exports.cotar = functions.database
  .ref('/cotacao/{uid}/cotacaoTime')
  .onWrite(async (event, context) => {

    //{"uid":{"points":{"A":{"lat":0, "lng":0}, "B":{"lat":0, "lng":0} } } }

    const uid = context.params.uid

    console.log("call");

    //console.log(uid);

    const pontos = await event.after.ref.parent.child("points").get()
    if (pontos && pontos.val()) {
      
      console.log(pontos.val());

      let capitais = await getCapitais();
      console.log(capitais);

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

  async function getCapitais() {
    let capitais = [];
    let ref = functions.database.ref("capitais/-N2wnm-IoolNSJmi-DFb/brasil");
    ref.get().then((capitaisRef) => {
      capitais = capitaisRef.val();
      return capitais;
    }).catch((e) => {
      console.log(e);
      return [];
    });
    
  }

  async function getFornecedores() {
    let fornecedores = [];
  }

  async function calcFreteFornecedor(cidadeOrigem, estadoOrigem, cidadeDestino, estadoDestino, fornecedor) {

  }