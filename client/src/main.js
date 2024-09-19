import { createApp } from 'vue';
import App from './App.vue';
import router from './router';
import axios from './axios';
import { createPinia } from 'pinia';
import 'bootstrap/dist/css/bootstrap.min.css';

// createApp(App)
//   .use(router)
//   .mount('#app');

const app = createApp(App);
const pinia = createPinia();

app.config.globalProperties.$axios = axios;
app.use(router);
app.use(pinia); 
app.mount('#app');