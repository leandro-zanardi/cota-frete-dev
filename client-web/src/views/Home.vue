<template>
  <main class="home h-100 p-2 d-flex flex-row justify-content-center align-items-stretch">

    <div class="left p-3 d-flex flex-column">
      <GMapAutocomplete
        placeholder="Digite o ponto de origem"
        @place_changed="(par) => setPlace(par, 'A')"
        class="autocomplete mb-4"
        id="campo1"
        :options="{
          componentRestrictions: { country: ['br'] },
          fields: ['address_components', 'geometry'],
          types: ['address'],
        }"
      >
      </GMapAutocomplete>
      
      <div class="text-center pb-3"> 
        <MDBBtn  outline="primary" floating class="fa-rotate-90" v-on:click="swapValues">
          <MDBIcon icon="exchange-alt"></MDBIcon>
        </MDBBtn> 
      </div>
  
      <GMapAutocomplete
        placeholder="Digite o ponto de destino"
        @place_changed="(par) => setPlace(par, 'B')"
        class="autocomplete  mb-4"
        id="campo2"
        :options="{
          componentRestrictions: { country: ['br'] },
          fields: ['address_components', 'geometry'],
          types: ['address'],
        }"
      >
      </GMapAutocomplete>

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

    <div class="flex-fill p-3 h-100">
      <div style="height: calc(100%);">
        <GMapMap
          :center="mapCenter"
          :zoom="16"
          class="h-100"
        >
          <GMapMarker
            :key="index"
            v-for="(m, index) in markers"
            :position="m.position"
            :clickable="false"
            :draggable="false"
            :controls="false"
          />
        </GMapMap>
      </div>
    </div>

    <br/>
  </main>
</template>

<script setup>
  import { onBeforeMount, ref } from 'vue';
  import { MDBBtn, MDBIcon } from 'mdb-vue-ui-kit';
  import { MDBTable } from 'mdb-vue-ui-kit';
  import { useStore } from 'vuex'
  import { computeDistanceBetween } from 'spherical-geometry-js'
  
  const store = useStore();

  const mapCenter = ref({});
  mapCenter.value = {lat: -23.6815302, lng: -46.8761758};

  const markers = ref({});
  markers.value = [];

  const points = ref({});
  const  distancia = ref({});
  distancia.value = 0;

  onBeforeMount(() => {
    store.dispatch('cotacaoStore/init', store.state.userStore.user.uid);
  })

  function setPlace(param1, pointPosition) {
    console.log(param1)
    console.log(param1.geometry.location.lat())
    console.log(param1.geometry.location.lng())

    let city = null
    for ( let x=0; x<param1.address_components.length; x++) {
      let component = param1.address_components[x];
      for ( let y=0; y<component.types.length; y++) {
        if (component.types[y] === 'administrative_area_level_2') {
          city = component.long_name;
          break;
        }
      }
    }

    let point = { 
      lat: param1.geometry.location.lat(),
      lng: param1.geometry.location.lng(),
      city: city
    };

    mapCenter.value = point;

    points.value[pointPosition] = point;

    console.log(pointPosition)

    markers.value.push({
      position: point
    })


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


</script>

<style>
  .left{
    min-width: 350px;
  }
</style>