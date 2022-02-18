<template>
  <main class="home h-100 p-2 d-flex justify-content-sm-around align-items-sm-center">

    <div class="left form-outline form-white flex-fill p-3">
      <GMapAutocomplete
        placeholder="Digite o ponto de origem"
        @place_changed="setPlace"
        class="autocomplete"
      >
      </GMapAutocomplete>

      <GMapAutocomplete
        placeholder="Digite o ponto de destino"
        @place_changed="setPlace"
        class="autocomplete"
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

    <div class="right flex-fill  p-3">
      <GMapMap
        :center="mapCenter"
        :zoom="16" style="height:600px;"
      >
        <GMapMarker
          :key="index"
          v-for="(m, index) in markers"
          :position="m.position"
          :clickable="true"
          :draggable="true"
        />
      </GMapMap>
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

</style>