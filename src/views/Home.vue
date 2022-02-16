<template>
  <main class="home" >

    <div class="left">
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

      <button class="botao_cotar"> Cotar </button>
    </div>

    <div class="right">
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