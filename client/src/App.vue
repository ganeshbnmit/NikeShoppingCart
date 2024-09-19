<template>
  <div id="app">
     <MainMenu v-if="!isAdminPage" />
    <router-view />
  </div>
</template>

<script>
import { computed } from 'vue'
import MainMenu from './components/MainMenu.vue'
import { useRoute } from 'vue-router'

export default {
  name: 'App',
  components: {
    MainMenu
  },
  setup() {
    const route = useRoute()
    
    // Compute whether the current route is an admin page
    const isAdminPage = computed(() => route.path.startsWith('/admin'))

    return {
      isAdminPage
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

