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

      // adicionar flag de capital nos pontos
      adicionarCapitaisParaPontos(pontos, capitais);
      console.log("pontos com capital")
      console.log(pontos)
      
      // verificar os fornecedores que tem origem no ponto -1
      let fornecedoresHabilitados = verificarFornecedores(pontos[0], fornecedores)
      console.log("fornecedores habilitados")
      console.log(fornecedoresHabilitados);
      // TODO verificar se as origens tem destino nos demais pontos

      var cotacoes = [];
      fornecedoresHabilitados.forEach(fornecedorHabilitado => {
        let fornecedorCalculado = {
          "fid": fornecedorHabilitado.nome,
          "nome": fornecedorHabilitado.nome,
          "preco": calcularFrete(fornecedorHabilitado, pontos)
        }
        cotacoes.push(fornecedorCalculado);
      });

      const root = event.after.ref.parent.child("valores")
      return root.set(cotacoes)

    } else {
      console.log("sem pontos")
      return 0;
    }

  });

  function adicionarCapitaisParaPontos(pontos, capitais) {
    pontos.forEach(ponto => {
      if (capitais.filter((capital) => 
        capital.estado === ponto.state && capital.capital === ponto.city).length) {
          ponto.capital = true;
      } else {
        ponto.capital = false;
      }
    });
  }

  function verificarFornecedores(pontoOrigem, fornecedores) {
    let fornecedoresHabilitados = [];
    let fornecedorKeys = Object.keys(fornecedores);
    for(let x=0; x<fornecedorKeys.length; x++) {
      let fornecedorOrigens = fornecedores[fornecedorKeys[x]].origens;
      for (let y=0; y<fornecedorOrigens.length; y++){
        let origem = fornecedorOrigens[y];
        if (origem.estado === pontoOrigem.state && origem.capital === pontoOrigem.capital){
          let fornecedorHabilitado = {
            "nome": fornecedorKeys[x],
            "origem": origem
          }
          fornecedoresHabilitados.push(fornecedorHabilitado);
        }
      }
    }
    return fornecedoresHabilitados;
  }

  function calcularFrete(fornecedorHabilitado, pontos) {
    let valorTotal = 0;
    for(let x=0; x<pontos.length; x++) {
      if (x+1 < pontos.length) {
        let distanciaKm = calcularDistancia(pontos[x], pontos[x+1]);
        let destino = obterDestino(fornecedorHabilitado.origem.destinos, pontos[x+1].state, pontos[x+1].capital);
        valorTotal = valorTotal + ( destino.preco_km * distanciaKm );
      }
    }
    return valorTotal;
  }

  function calcularDistancia(pontoA, pontoB) {
    return calculateDistanceLatLng(pontoA.lat, pontoA.lng, pontoB.lat, pontoB.lng);
  }

  function calculateDistanceLatLng(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        Math.cos((lat2 - lat1) * p) / 2 +
        Math.cos(lat1 * p) * Math.cos(lat2 * p) * (1 - Math.cos((lon2 - lon1) * p)) / 2;
    return 12742 * Math.asin(Math.sqrt(a));
  }

  function obterDestino(destinos, estado, ehCapital) {
    // TODO criar o looping de destino depois de validar os destinos
    // assim como foi validado a origem
    return destinos[0];
  }

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

