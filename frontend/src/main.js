import Vue from "vue"
import VueRouter from "vue-router"
import App from "./App.vue"
import NessusImport from "./pages/NessusImport.vue"
import ReportView from "./pages/ReportView.vue"
import HostView from "./pages/HostView.vue"

import './assets/tailwind.css'

Vue.config.productionTip = false

Vue.use(VueRouter)
Vue.filter('snakeToTitleCase', function (value) {
  if (!value) return ''
  value = value.toString()
  return value.charAt(0).toUpperCase() + value.slice(1)
})

const routes = [
  {
    path: "/",
    name: "reports",
    component: NessusImport,
  },
  {
    path: "/reports/:id",
    name: "reports.show",
    component: ReportView,
  },
  {
    path: "/reports/:report_id/hosts/:id",
    name: "hosts.show",
    component: HostView,
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
