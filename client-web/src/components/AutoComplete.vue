<template>
  <div class="component-main">
      <div  class="d-flex flex-column mb-4 p-2 box-main">
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

        <div v-if="ativaModalEntrega" class="d-flex flex-column  mb-1 mt-1">
          <label> Categoria</label>
          <select v-model="escolhaVeiculo">
            <option :value="1">Moto</option>
            <option :value="2">Carro</option>
            <option :value="3">Van</option>
          </select>
        </div>

        <div v-if="ehPrimeiroPonto"  class="d-flex flex-row  mb-1 mt-1">
          <label> Retorna Para Origem</label>
          <div >
            <input type="checkbox" v-model="retorna" style="margin-left:8px"/>
          </div>
        </div>
        

      </div>
  </div>
</template>

<script setup>
    import {defineProps, defineEmits, ref} from 'vue';

    const escolhaVeiculo = ref();
    const detalhes = ref();
    const retorna = ref();

    defineProps({
      ativaModalEntrega: Boolean,
      retornaParaOrigem: Boolean,
      ehPrimeiroPonto: Boolean
    });

    const emit = defineEmits({
        place_changed: (par) => {
            return par;
        }
    })

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
    background-color: #c0c0c0;
    border: 1px solid;
}
</style>