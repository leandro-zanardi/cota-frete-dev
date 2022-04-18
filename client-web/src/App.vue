<template>

  <div class="h-100 d-flex flex-column">
    <div id="nav" v-if="$store.state.userStore.user">

    <MDBNavbar light style="background-color: #00BCD4" expand="md" container>
        <MDBNavbarNav class="d-flex flex-row text-white" center> 
          <MDBNavbarItem active><router-link class="p-2" to ="/">Home</router-link> | </MDBNavbarItem>
          <MDBNavbarItem active><router-link class="p-2" to ="/about">About</router-link></MDBNavbarItem>
          <MDBNavbarItem v-show="$store.state.userStore.isAdmin"><router-link class="p-2" to ="/fornecedores">Fornecedores</router-link></MDBNavbarItem>
          <MDBNavbarItem active>
            <MDBDropdown btnGroup align="end" v-model="dropdown" class="shadow-0">
              <MDBDropdownToggle @click="dropdown = !dropdown" color="Cyan 400" size="sm" class="text-white">
                <i class="fas fa-user fa-lg text-white"></i>
              </MDBDropdownToggle>
              <MDBDropdownMenu aria-labelledby="dropdownMenuButton">
                <MDBDropdownItem href="#" class="text-dark"><router-link class="p-2 nav-link" to ="/configuracoes-usuario">Configurações</router-link></MDBDropdownItem>
                <MDBDropdownItem href="#" class="text-dark"><router-link class="p-2 nav-link" to ="/configuracoes-fornecedor">Configurações de fornecedor</router-link></MDBDropdownItem>
                <MDBDropdownItem href="#" class="text-dark"><router-link class="p-2 nav-link" to ="/historico">Histórico de fretes</router-link></MDBDropdownItem>
                <MDBDropdownItem divider />
                <MDBDropdownItem href="#" class="text-dark" @click="$store.dispatch('userStore/logout')">Sair</MDBDropdownItem>
              </MDBDropdownMenu>
            </MDBDropdown>
          </MDBNavbarItem>
        </MDBNavbarNav>
      </MDBNavbar>

    </div>
    <router-view/>
  </div>
</template>

<script setup>
import { onBeforeMount, ref } from 'vue'
import { useStore } from 'vuex'
  import {
    MDBNavbar,
    MDBNavbarNav,
    MDBNavbarItem,
    MDBBtn,
    MDBDropdown,
    MDBDropdownToggle,
    MDBDropdownMenu,
    MDBDropdownItem
  } from 'mdb-vue-ui-kit';

  const store = useStore();
  const dropdown = ref(false);

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

a:link {
  color: white;
  background-color: transparent;
  text-decoration: none;
}

a:visited {
  color: white;
  background-color: transparent;
  text-decoration: none;
}

a:hover {
  color: red;
  background-color: transparent;
  text-decoration: underline;
}

a:active {
  color: darkred;
  background-color: transparent;
  text-decoration: underline;
}

.nav-link{
  color: black;
}
</style>
