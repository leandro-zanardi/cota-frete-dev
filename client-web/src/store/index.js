import { createStore } from 'vuex'
import userStore from "./userStore"
import cotacaoStore from "./cotacaoStore"

const store = createStore();

console.log(userStore);

store.registerModule('userStore', userStore);
store.registerModule('cotacaoStore', cotacaoStore);

export default store;