import Vue from "vue"
import VueRouter from "vue-router"
import App from "./App.vue"
import Reports from "./components/Reports.vue"
import Report from "./components/Report.vue"

import './assets/tailwind.css'

Vue.config.productionTip = false

Vue.use(VueRouter)

const routes = [
  {
    path: "/",
    name: "reports",
    component: Reports,
  },
  {
    path: "/reports/:id",
    name: "reports.show",
    component: Report,
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
