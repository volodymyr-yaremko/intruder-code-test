import Vue from "vue"
import VueRouter from "vue-router"
import App from "./App.vue"
import Reports from "./components/Reports.vue"

import './assets/tailwind.css'

Vue.config.productionTip = false

Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    name: "reports",
    component: Reports,
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
