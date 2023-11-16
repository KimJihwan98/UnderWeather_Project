import { createApp } from 'vue'
import { createPinia } from 'pinia'
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap-icons/font/bootstrap-icons.css';


import App from './App.vue'
import router from './router'
import axios from 'axios'

const app = createApp(App)

app.config.globalProperties.$axios = axios;

app.use(createPinia())
app.use(router)

app.mount('#app')
