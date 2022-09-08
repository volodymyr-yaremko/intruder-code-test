<template>
  <div class="w-2/3 mx-auto mt-5" v-if="host">
    <router-link
      :to="{ name: 'reports.show', params: { id: $route.params.report_id } }"
      class="
        text-blue-700
        border border-blue-700
        hover:bg-blue-700 hover:text-white
        focus:ring-4 focus:outline-none focus:ring-blue-300
        font-medium
        rounded-lg
        text-sm
        p-2.5
        text-center
        inline-flex
        items-center
        mr-2
        dark:border-blue-500
        dark:text-blue-500
        dark:hover:text-white
        dark:focus:ring-blue-800
      "
    >
      Back to report
    </router-link>

    <h1 class="text-2xl font-semibold text-center">
      {{ host.name }}
    </h1>
    <div class="bg-white rounded-lg shadow my-5">
      <ReportItemList :host="host.name" :items="items" @fetch="onFetchItems" />
    </div>
  </div>
</template>

<script>
import axios from "axios";
import ReportItemList from "../components/ReportItemList.vue";

export default {
  data() {
    return {
      host: null,
      items: [],
    };
  },
  methods: {
    onFetchItems({ page, onSuccess }) {
      const { report_id: reportId, id } = this.$route.params;

      return axios
        .get(
          `http://localhost:3000/api/v1/reports/${reportId}/hosts/${id}/items`,
          { params: { page } }
        )
        .then(({ data }) => {
          this.items = [...this.items, ...data];
          if (typeof onSuccess === "function") onSuccess(page);
        });
    },
  },
  mounted() {
    const { report_id: reportId, id } = this.$route.params;
    axios
      .get(`http://localhost:3000/api/v1/reports/${reportId}/hosts/${id}`)
      .then(({ data }) => {
        this.host = data;
      });
  },
  components: { ReportItemList },
};
</script>
