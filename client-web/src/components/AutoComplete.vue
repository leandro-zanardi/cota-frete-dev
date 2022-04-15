<template>
  <div class="component-main">
      <div  class="d-flex flex-column mb-4 p-2 box-main shadow-3">
        <GMapAutocomplete
          placeholder="Ponto de origem"
          @place_changed="placeChanged"
          class="autocomplete mb-2"
          :id="'campo' + x" 
          :options="{
            componentRestrictions: { country: ['br'] },
            fields: ['address_components', 'geometry'],
            types: ['address'],
          }"
        >
        </GMapAutocomplete>
        <div class="d-flex flex-column mb-1 mt-1">
          <label for= "text">  </label>
          <input type = "text" placeholder="Observações" />
        </div>
        
        <div v-if="ativaModalEntrega" class="mb-1 mt-1">
          <MDBDropdown btnGroup v-model="dropdown" class="shadow-0">
              <MDBDropdownToggle @click="dropdown = !dropdown" color="link" class="text-dark">
                Veículo
              </MDBDropdownToggle>
              <MDBDropdownMenu>
                <MDBDropdownItem href="#" class="text-dark">Moto</MDBDropdownItem>
                <MDBDropdownItem href="#" class="text-dark">Carro</MDBDropdownItem>
                <MDBDropdownItem href="#" class="text-dark">Van</MDBDropdownItem>
              </MDBDropdownMenu>
          </MDBDropdown>
        </div>

        <div v-if="ehPrimeiroPonto"  class="d-flex flex-row  mb-1 mt-1">
          <div >
            <input type="checkbox" v-model="retorna" style="margin-right:8px"/>
          </div>
          <label> Retorna Para Origem</label>
        </div>
      </div>
  </div>
</template>

<script setup>
    import {defineProps, defineEmits, ref} from 'vue';
    import { MDBDropdown, MDBDropdownToggle, MDBDropdownMenu, MDBDropdownItem } from "mdb-vue-ui-kit";

    const escolhaVeiculo = ref();
    const detalhes = ref();
    const retorna = ref();
    const dropdown = ref(false);

    defineProps({
      ativaModalEntrega: Boolean,
      retornaParaOrigem: Boolean,
      ehPrimeiroPonto: Boolean
    });

    const emit = defineEmits({
        place_changed: (par) => {
            return par;
        }
    });

    function placeChanged(gmapPar) {

        // formatar o endereco
      let city = null;
      for ( let x=0; x<gmapPar.address_components.length; x++) {
        let component = gmapPar.address_components[x];
        for ( let y=0; y<component.types.length; y++) {
          if (component.types[y] === 'administrative_area_level_2') {
            city = component.long_name;
            break;
          }
        }
      }

      // adiciona um ponto na lista de pontos global
      let point = { 
        lat: gmapPar.geometry.location.lat(),
        lng: gmapPar.geometry.location.lng(),
        city: city
      };


      let place = { 
        point: point,
        veiculo: escolhaVeiculo.value,
        detalhes: detalhes.value
      }

      emit('place_changed', place)
    }

</script>

<style>
.box-main {
  border-radius: 10px;
  /* border: 2px solid lightgray; */
  background-color: white;
}
</style>