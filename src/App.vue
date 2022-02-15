<template>
  <div id="nav" v-if="$store.state.user">
    <router-link to="/">Home</router-link> |
    <router-link to="/about">About</router-link>
    <button @click="$store.dispatch('logout')">Logout</button>
  </div>
  <router-view/>
</template>

<script>
import { onBeforeMount } from 'vue'
import { useStore } from 'vuex'
export default {
  setup() {
    const store = useStore()
    onBeforeMount(() => {
      store.dispatch('fetchUser')
    })
  }
}
</script>

<style>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: right;
  color: #2c3e50;
}
#nav {
  padding: 30px;
}
#nav a {
  font-size: 1.1rem;
  font-weight: bold;
  color: #2c3e50;
  margin: 0 10px;
  text-decoration: none;
}
#nav a.router-link-exact-active {
  color: #2100b6;
}

button {
  font-size: 1.1rem;
  font-weight: bold;
  color: #2c3e50;
  padding: 10px;
  margin-left: 15px;
  border-radius: 4px;
  border: none;
}

button:hover {
  transition: .6s ease;
}
</style>