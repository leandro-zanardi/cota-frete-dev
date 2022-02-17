<template>
  <div id="nav" v-if="$store.state.user">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    <button @click="$store.dispatch('logout')">Logout</button>
  </div>
  <MDBContainer class="h-100">
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

html, body {
  height: calc(100%);
}

#app {
  height: calc(100%);
  font-family: Roboto, Helvetica, Arial, sans-serif;
}
</style>
