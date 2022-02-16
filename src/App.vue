<template>
  <div id="nav" v-if="$store.state.user">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    <button @click="$store.dispatch('logout')">Logout</button>
  </div>
  <MDBContainer>
    <router-view/>
  </MDBContainer>
</template>

<script>
import { onBeforeMount } from 'vue'
import { useStore } from 'vuex'
import { MDBContainer } from "mdb-vue-ui-kit";

export default {

  components: {
    MDBContainer
  },

  setup() {
    const store = useStore()
    onBeforeMount(() => {
      store.dispatch('fetchUser')
    })
  }
}
</script>
<style>
#app {
  font-family: Roboto, Helvetica, Arial, sans-serif;
}
</style>
