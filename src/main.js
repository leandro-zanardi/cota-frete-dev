import { createApp } from 'vue'
import VueGoogleMaps from '@fawmi/vue-google-maps'

import App from './App.vue'
import router from './router'
import store from './store'

createApp(App)
    .use(store)
    .use(router)
    .use(VueGoogleMaps, {
        load: {
            key: 'AIzaSyBH6Lo-AYorg_bHSgXZUIto8Y-pveJR0OY',
            libraries: "places"
            // language: 'de',
        },
    })
    .mount('#app')
