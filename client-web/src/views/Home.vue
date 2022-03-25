<template>
  <main class="home h-100 p-2 d-flex flex-row justify-content-center align-items-stretch">
    <div class="row w-100 "> 
      
      <div class="left p-3 pb-5 col-4" style="overflow:auto" > 

        <div class="d-flex flex-column">
        <AutoComplete
          :ativaModalEntrega = "ponto.ativaModalEntrega"
          :retornaParaOrigem = "ponto.retornaParaOrigem"
          :ehPrimeiroPonto = "ponto.ehPrimeiroPonto"
          v-for="ponto in pontosColetaEntrega" 
          v-bind:key="ponto.id"
          @place_changed="(par) => setPlace(par, ponto.id)"

        />
        
        
        <div class="text-center pb-3"> 
          <MDBBtn  outline="primary" floating class="fa-rotate-90" v-on:click="swapValues">
            <MDBIcon icon="exchange-alt"></MDBIcon>
          </MDBBtn> 

          <MDBBtn  outline="primary" floating class="fab" v-on:click="adicionaNovoPonto">
            <MDBIcon icon="plus"></MDBIcon>
          </MDBBtn> 

          <MDBBtn  outline="primary" floating class="fas" v-on:click="removeUltimoPonto">
            <MDBIcon icon="ban"></MDBIcon>
          </MDBBtn> 

        </div>
    
      

        <MDBBtn
          class="botao_cotar"
          color="primary"
          type="submit"
          size="lg"
          @click="getCotacao">
            Cotar
        </MDBBtn>
        
        <MDBTable striped v-if="distancia && Number(distancia.charAt(0))">
          <tr>
            <th>Distância</th>
            <td>{{distancia}}</td>
          </tr>
        </MDBTable>

        <MDBTable striped v-if="$store.state.cotacaoStore.cotacao &&
          $store.state.cotacaoStore.cotacao.valores &&
          $store.state.cotacaoStore.cotacao.valores.length">
          <tr>
            <th>Fornecedor</th>
            <th>Valor</th>
          </tr>
          <tr v-for="fornecedor in $store.state.cotacaoStore.cotacao.valores" v-bind:key="fornecedor.fid">
            <td>{{fornecedor.nome}}</td>
            <td>{{fornecedor.preco.toLocaleString('pt-br', {style: 'currency', currency: 'BRL'})}}
            </td>
          </tr>
        </MDBTable>
        </div>
      </div>

      <div class="flex-fill p-3 h-100 col-8">
        <div style="height: calc(100%);">
          <GMapMap
            ref="mapRef"
            :zoom="4"
            :center="mapCenter"
            class="h-100"
            :disableDefaultUI="true"
          >
            <GMapMarker
              :key="index"
              v-for="(m, index) in markers"
              :position="m.position"
              :icon='{
                url: "https://cdn-icons-png.flaticon.com/512/75/75782.png",
                scaledSize: {width: 60, height: 60},
              }'
              :clickable="false"
              :draggable="false"
              :controls="false"
            />

            <GMapPolyline
              :options='{
                geodesic: true,
                strokeColor: "#FF0000",
                strokeOpacity: 1.0, 
              }'
              :ref="polyline"
              :path="paths"
            />
          </GMapMap>
        </div>
      </div>
    </div>

    <br/>
  </main>
</template>

<script setup>
  import AutoComplete from '@/components/AutoComplete';
  import { onBeforeMount, ref } from 'vue';
  import { MDBBtn, MDBIcon } from 'mdb-vue-ui-kit';
  import { MDBTable } from 'mdb-vue-ui-kit';
  import { useStore } from 'vuex'
  import { computeDistanceBetween } from 'spherical-geometry-js'
  import {PontoColetaEntrega} from '@/models/PontoColetaEntrega';
  
  const store = useStore();

  const markers = ref({});
  markers.value = [];

  const points = ref({});
  const  distancia = ref({});
  distancia.value = 0;

  const paths = ref([]);

  var mapRef = ref();

  const mapCenter = ref({});
  mapCenter.value = {lat: -12.2884381, lng: -57.3592675};

  const pontosIds = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];
  var pontosIdsLast = 1;
  const pontosColetaEntrega = ref([
    new PontoColetaEntrega('A', true, true),
    new PontoColetaEntrega('B')
  ]);

  onBeforeMount(() => {
    store.dispatch('cotacaoStore/init', store.state.userStore.user.uid);
  })

  function setPlace(par, pointPosition) {

    console.log('SET PLACE')
    console.log(par);

    // limpa o banco com pontos
    store.dispatch('cotacaoStore/clear', store.state.userStore.user.uid);
    // limpa o calculo de distancia
    distancia.value = 0;

    
    points.value[pointPosition] = par.point;
    

    // insere path e bounds
    let pointKeys = Object.keys(points.value);
    // desenhar linha e definir bounds
    paths.value = [];
    // inicializa o objeto LatLngBounds
    const bounds = new window.google.maps.LatLngBounds();
    // limpa os marcadores
     markers.value = [];

    pointKeys.forEach(key => {
      let currentPoint = points.value[key];
      let pointI = {lat: currentPoint.lat, lng: currentPoint.lng};
      // insere na lista de paths um ponto para o desenho das linhas
      paths.value.push(pointI);
      // insere um novo ponto na instancia de LatLngBounds
      bounds.extend(pointI);
      // redefine os marcadores
      markers.value.push({
        position: pointI
      });
    })
    // redefine os bounds do mapa
    mapRef.value.fitBounds(bounds);
    
  }

  function getCotacao() {

    console.log("get cotacao");

    let userPoint = {
      userUid: store.state.userStore.user.uid,
      points: points.value,
      cotacaoTime: new Date().getTime()
    }
    store.dispatch('cotacaoStore/create', userPoint);
    

    const cotacao = store.state.cotacaoStore.cotacao
    try {
      if(cotacao.points.A && cotacao.points.B){
        distancia.value = computeDistanceBetween({ lat: cotacao.points.A.lat, lng: cotacao.points.A.lng},
        { lat: cotacao.points.B.lat, lng: cotacao.points.B.lng})
        if (distancia.value >= 0 && distancia.value < 1000){
          distancia.value = distancia.value.toFixed()+" m"
        }
        else if (distancia.value >= 1000){
          distancia.value = (distancia.value/1000).toFixed(1).replace('.', ',')+" km"
        }
      }
    } catch (e) {
      console.log("Erro ao tratar distancia",e)
    }
  }

  function swapValues(){
    const field1 = document.getElementById('campo1');
    const field2 = document.getElementById('campo2');
    try {
      const point1 = points.value.A;
      points.value.A = points.value.B;
      points.value.B = point1;
    } catch (e) {
      console.log(e)
    }
    const field1Value = field1.value;
    field1.value = field2.value;
    field2.value = field1Value;
  }

  function adicionaNovoPonto() {
    if (pontosIdsLast < pontosIds.length) {
      pontosColetaEntrega.value.push(new PontoColetaEntrega(pontosIds[++pontosIdsLast]))
    }
  }

  function removeUltimoPonto() {
    if (pontosIdsLast >= 2) {
      pontosIdsLast--;
      pontosColetaEntrega.value.pop();
    }
  }


</script>

<style>
  .left{
    min-width: 250px;
  }
</style>