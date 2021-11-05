import Vue from "vue"
import VueRouter from "vue-router"
import BootstrapVue from "bootstrap-vue"
import App from "./App.vue"
import Dashboard from "./components/Dashboard.vue"

import "bootstrap/dist/css/bootstrap.css"
import "bootstrap-vue/dist/bootstrap-vue.css"

Vue.config.productionTip = false

Vue.use(BootstrapVue)
Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    name: "dashboard",
    component: Dashboard,
  },
]

const router = new VueRouter({
  routes: routes,
  mode: "history",
})

new Vue({
  router: router,
  render: (h) => h(App),
}).$mount("#app")
