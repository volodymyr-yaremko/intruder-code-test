<template>
  <div id="app">
    <!-- component matched by the route will render here -->
    <AppLayout>
      <router-view></router-view>
    </AppLayout>
  </div>
</template>

<script>
import AppLayout from "./layouts/AppLayout.vue";

export default {
  name: "App",
  components: { AppLayout },
};
</script>