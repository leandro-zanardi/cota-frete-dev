<template>
 

  <div class="h-100 d-flex flex-column">
    <div id="nav" v-if="$store.state.user">

    <MDBNavbar light bg="light" expand="lg" container>
        <MDBNavbarNav center> 
          <MDBNavbarItem  active><router-link class="p-2" to ="/">Home</router-link> | </MDBNavbarItem>
          <MDBNavbarItem ><router-link class="p-2" to ="/about">About</router-link></MDBNavbarItem>
          <MDBBtn size="sm" outline="primary" @click="$store.dispatch('logout')">Logout</MDBBtn>
        </MDBNavbarNav>
      </MDBNavbar>

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
