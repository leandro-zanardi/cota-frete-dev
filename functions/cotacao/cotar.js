const functions = require('firebase-functions')
const firebaseAdmin = require('firebase-admin');

exports.cotar = functions.database
  .ref('/cotacao/{uid}/cotacaoTime')
  .onWrite(async (event, context) => {

    const uid = context.params.uid

    console.log("call");


    const pontosRef = await event.after.ref.parent.child("points").get()
    if (pontosRef.exists()) {
      
      let pontos = pontosRef.val();
      console.log("pontos");
      console.log(pontos);

      let capitais = await getCapitais();
      console.log(capitais);

      let fornecedores = await getFornecedores();
      console.log(fornecedores);

      var cotacoes = []

      // adicionar flag de capital nos pontos
      
      // verificar os fornecedores que tem origem no ponto -1
      // verificar se as origens tem destino nos demais pontos


      for(let x=1; x<5; x++){
        let fornecedor = {
          "fid": x,
          "nome": "fornecedor " + x,
          "preco": Number((Math.random() * 100).toFixed(2))
        }
        cotacoes.push(fornecedor)
      }

      const root = event.after.ref.parent.child("valores")
      return root.set(cotacoes)

    } else {
      console.log("sem pontos")
      return 0;
    }

  });

  async function getCapitais() {
    try {
      console.log("capitais")
      let capitaisRef = await firebaseAdmin.database().ref("capitais/-N2wnm-IoolNSJmi-DFb/brasil").get()
      if (capitaisRef.exists()) {
        return capitaisRef.val();
      } else {
        return [];
      }
    } catch(e) {
      console.log (e);
      return [];
    }
  }

  async function getFornecedores() {
    try {
      console.log("fornecedores")
      let fornecedorRef = await firebaseAdmin.database().ref("fornecedor").get()
      if (fornecedorRef.exists()) {
        return fornecedorRef.val();
      } else {
        return [];
      }
    } catch(e) {
      console.log (e);
      return [];
    }
  }

  async function calcFreteFornecedor(cidadeOrigem, estadoOrigem, cidadeDestino, estadoDestino, fornecedor) {

  }