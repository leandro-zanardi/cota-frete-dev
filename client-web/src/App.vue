<template>
 

  <div class="h-100 d-flex flex-column">
<<<<<<< HEAD:src/App.vue
    <div id="nav" v-if="$store.state.user">

    <MDBNavbar light bg="light" expand="lg" container>
        <MDBNavbarNav center> 
          <MDBNavbarItem  active><router-link class="p-2" to ="/">Home</router-link> | </MDBNavbarItem>
          <MDBNavbarItem ><router-link class="p-2" to ="/about">About</router-link></MDBNavbarItem>
          <MDBBtn size="sm" outline="primary" @click="$store.dispatch('logout')">Logout</MDBBtn>
        </MDBNavbarNav>
      </MDBNavbar>

=======
    <div id="nav" v-if="$store.state.userStore.user">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
      <button @click="$store.dispatch('userStore/logout')">Logout</button>
>>>>>>> d715218326cf9a65b43b7e6716fe6a428d876cfb:client-web/src/App.vue
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
