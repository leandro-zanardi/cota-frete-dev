<template>
  <div class="component-main">
      <div  class="d-flex flex-column mb-4 p-2 box-main">
        <GMapAutocomplete
          placeholder="Digite o ponto de origem"
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
          <label> Descreva o que fazer: </label>
          <input type = "text" v-model="detalhes" />
        </div>

        <div class="d-flex flex-column  mb-1 mt-1">
          <label> Tipo de Veículo</label>
          <select v-model="escolhaVeiculo">
            <option :value="1">Moto</option>
            <option :value="2">Carro</option>
            <option :value="3">Van</option>
          </select>
          
        </div>
        

      </div>
  </div>
</template>

<script setup>
    import {defineProps, defineEmits, ref} from 'vue';

    const escolhaVeiculo = ref();
    const detalhes = ref();

    defineProps({
        teste: String
    });

    const emit = defineEmits({
        place_changed: (par) => {
            return par;
        }
    })

    function placeChanged(par) {

        let place = { 
            gmaps: par,
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