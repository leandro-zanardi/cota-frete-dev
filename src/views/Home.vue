<template>
  <main class="home" >
    <h1>{{texto}}</h1>
    <br/>
    <button @click="alertar">Alertar</button>
  </main>
</template>

<script setup>
  
  import { ref } from 'vue'

  const texto = ref('');
  texto.value = "bem vindos";

  function alertar() {
    console.log(texto);
    texto.value = "teste";
  }

</script>

<style scoped>
.home {
  background-color: aqua;
}
</style>