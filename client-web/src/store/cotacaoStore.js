import { firebaseDB, ref, set, onValue } from "../firebase";

const cotacaoStore = {
  namespaced: true,

  state: {
    cotacao: null
  },

  mutations: {
    SET_COTACAO(state, cotacao) {
      state.cotacao = cotacao;
    },

    CLEAR_COTACAO(state) {
      state.cotacao = null;
    }
  },

  actions: {

    init({commit}, userUid) {
      console.log('INIT');
      console.log(`cotacao/${userUid}`)
      const db = ref(firebaseDB, `cotacao/${userUid}`);
      onValue(db, (snapshot) => {
        const data = snapshot.val();
        console.log('ON VALUE');
        console.log('DATA');
        commit('SET_COTACAO', data);
      });
    },

    async create({ commit }, cotacao) {
      const db = ref(firebaseDB, `cotacao/${cotacao.userUid}`);
      await set(db, cotacao);
    }
  }

};

export default cotacaoStore;