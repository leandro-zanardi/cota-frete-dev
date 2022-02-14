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
        :center="{lat: -23.6815302, lng: -46.8761758}"
        :zoom="17" style="height:600px;"
      />
    </div>

    
    <br/>
  </main>
</template>

<script setup>
  
  //import { ref } from 'vue'

  function setPlace(param1) {
    console.log(param1)
  }


</script>

<style scoped>
.home {
  height: 600px;
}

.vue-map-container {
  height:600px;
}

.botao_cotar {
  width:200px;
  height:50px;
}

.autocomplete {
  border:1px solid;
}

.left{
  width:50%;
  height:calc(100%);
  float:left;
  background-color: beige;
}

.right {
  background-color: aquamarine;
  width:50%;
  height:600px;
  float:right;
}
</style>