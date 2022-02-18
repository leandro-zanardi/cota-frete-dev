<template>
  <main class="home h-100 p-2 d-flex flex-row justify-content-center align-items-stretch">

    <div class="left p-3 d-flex flex-column">
      <GMapAutocomplete
        placeholder="Digite o ponto de origem"
        @place_changed="setPlace"
        class="autocomplete mb-4"
      >
      </GMapAutocomplete>

      <GMapAutocomplete
        placeholder="Digite o ponto de destino"
        @place_changed="setPlace"
        class="autocomplete  mb-4"
      >
      </GMapAutocomplete>

      <MDBBtn
        class="botao_cotar"
        color="primary"
        type="submit"
        size="lg">
          Cotar
      </MDBBtn>
    </div>

    <div class="flex-fill p-3 h-100">
      <div style="background-color:#00ff00; height: calc(100%);">
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
  
  import { ref } from 'vue';
  import { MDBBtn } from 'mdb-vue-ui-kit';

  const mapCenter = ref({});
  mapCenter.value = {lat: -23.6815302, lng: -46.8761758};

  const markers = ref({});
  
  markers.value = [];

  // {
  //   position: {
  //     lat: 51.093048, lng: 6.842120
  //   },
  // }


  function setPlace(param1) {
    console.log(param1)
    console.log(param1.geometry.location.lat())
    console.log(param1.geometry.location.lng())

    let point = { lat: param1.geometry.location.lat(), lng: param1.geometry.location.lng() };

    mapCenter.value = point;

    markers.value.push({
      position: point
    })
  }


</script>

<style>
  .left{
    min-width: 350px;
  }
</style>