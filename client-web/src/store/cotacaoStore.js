import { firebaseDB, ref, set, onValue, get } from "../firebase";

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
    },

    async get({ commit }, userUid) {
      const db = ref(firebaseDB, `cotacao/${userUid}`);
      await onValue(db, (snapshot) => {
        console.log(snapshot.val());
        commit('SET_COTACAO',snapshot.val());
      });
    }
  }

};

export default cotacaoStore;