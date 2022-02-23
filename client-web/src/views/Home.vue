<template>
  <main class="home h-100 p-2 d-flex flex-row justify-content-center align-items-stretch">

    <div class="left p-3 d-flex flex-column">
      <GMapAutocomplete
        placeholder="Digite o ponto de origem"
        @place_changed="(par) => setPlace(par, 'A')"
        class="autocomplete mb-4"
        :options="{
          componentRestrictions: { country: ['br'] },
          fields: ['address_components', 'geometry'],
          types: ['address'],
        }"
      >
      </GMapAutocomplete>

      <GMapAutocomplete
        placeholder="Digite o ponto de destino"
        @place_changed="(par) => setPlace(par, 'B')"
        class="autocomplete  mb-4"
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
        size="lg">
          Cotar
      </MDBBtn>

      <div>
        {{$store.state.cotacaoStore.cotacao}}
      </div>
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
  import { onBeforeMount, ref } from 'vue';
  import { MDBBtn } from 'mdb-vue-ui-kit';
  import { useStore } from 'vuex'

  const store = useStore();

  const mapCenter = ref({});
  mapCenter.value = {lat: -23.6815302, lng: -46.8761758};

  const markers = ref({});
  markers.value = [];

  const points = ref({});

  onBeforeMount(() => {
    store.dispatch('cotacaoStore/init', store.state.userStore.user.uid);
  })

  function setPlace(param1, pointPosition) {
    console.log(param1)
    console.log(param1.geometry.location.lat())
    console.log(param1.geometry.location.lng())

    let point = { lat: param1.geometry.location.lat(), lng: param1.geometry.location.lng() };

    mapCenter.value = point;

    points.value[pointPosition] = point;

    console.log(pointPosition)

    markers.value.push({
      position: point
    })

    getCotacao();
    
  }

  function getCotacao() {

    let userPoint = {
      userUid: store.state.userStore.user.uid,
      points: points.value,
      value: null
    }
    store.dispatch('cotacaoStore/create', userPoint);
  }


</script>

<style>
  .left{
    min-width: 350px;
  }
</style>