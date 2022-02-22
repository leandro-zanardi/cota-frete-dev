<template>

  <div class="h-100 d-flex flex-column">
    <div id="nav" v-if="$store.state.userStore.user">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
      <button @click="$store.dispatch('userStore/logout')">Logout</button>
    </div>
    <router-view/>
  </div>
</template>

<script setup>
import { onBeforeMount } from 'vue'
import { useStore } from 'vuex'
  import {
    MDBNavbar,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBBtn
  } from 'mdb-vue-ui-kit';

  const store = useStore();

  onBeforeMount(() => {
    store.dispatch('userStore/fetchUser')
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
