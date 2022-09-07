<template>
  <div class="w-2/3 mx-auto mt-5" v-if="report">
    <h1 class="text-2xl font-semibold text-center">
      {{ report.name }}
    </h1>

    <div class="bg-white rounded-lg shadow my-5">
      <ul class="divide-y-2 divide-gray-100">
        <li class="p-3" v-for="host in report.report_hosts" :key="host.id">
          <h2 class="text-xl mt-3">
            <router-link
              class="text-blue-600"
              :to="{
                name: 'hosts.show',
                params: { report_id: $route.params.id, id: host.id },
              }"
            >
              <span class="uppercase font-bold">Host</span>&nbsp;({{
                host.name
              }})
            </router-link>
          </h2>
          <p class="text-gray-500 mt-4 leading-8">{{ host.props | join }}</p>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data() {
    return {
      report: null,
    };
  },
  mounted() {
    axios
      .get(`http://localhost:3000/api/v1/reports/${this.$route.params.id}`)
      .then(({ data }) => {
        this.report = data;
      });
  },
  filters: {
    join(props) {
      return Object.keys(props)
        .map((key) => `[${key}]: ${props[key]}`)
        .join(", ");
    },
  },
};
</script>
