<template>
  
  <div class="h-100 d-flex flex-column">
    <div id="nav" v-if="$store.state.user">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
      <button @click="$store.dispatch('logout')">Logout</button>
    </div>
    <router-view/>
  </div>
</template>

<script setup>
import { onBeforeMount } from 'vue'
import { useStore } from 'vuex'

  const store = useStore()
  onBeforeMount(() => {
    store.dispatch('fetchUser')
  })

</script>
<style>

html, body {
  height: calc(100%);
}

#app {
  height: calc(100%);
  font-family: Roboto, Helvetica, Arial, sans-serif;
}
</style>
