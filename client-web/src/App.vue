<template>

  <div class="h-100 d-flex flex-column">
    <div id="nav" v-if="$store.state.userStore.user">

    <MDBNavbar light bg="light" expand="md" container>
        <MDBNavbarNav center> 
          <MDBNavbarItem active><router-link class="p-2" to ="/">Home</router-link> | </MDBNavbarItem>
          <MDBNavbarItem active><router-link class="p-2" to ="/">About</router-link></MDBNavbarItem>
          <MDBNavbarItem v-show="$store.state.userStore.isAdmin"><router-link class="p-2" to ="/fornecedores">Fornecedores</router-link></MDBNavbarItem>
          <MDBBtn size="xs-2" outline="primary" @click="$store.dispatch('userStore/logout')">Logout</MDBBtn>
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
