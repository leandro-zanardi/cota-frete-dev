<template>
  <main class="home" >

    <div class="left">
      de: <input type="text" style="border:1px solid;"/><br/>
      para: <input type="text"  style="border:1px solid;"/>
    </div>

    <div class="right">

    </div>

    
    <br/>
  </main>
</template>

<script setup>
  
  import { ref } from 'vue'

  const texto = ref('');
  texto.value = "bem vindos";

  // function alertar() {
  //   console.log(texto);
  //   texto.value = "teste";
  // }

</script>

<style scoped>
.home {
}

.left{
  width:50%;
}

.right {
  width:50%;
}
</style>