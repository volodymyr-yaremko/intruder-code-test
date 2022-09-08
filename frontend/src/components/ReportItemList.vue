<template>
  <virtual-list
    scrollable
    :data-key="'id'"
    :data-sources="items"
    :data-component="itemComponent"
    :extra-props="{ host }"
    :page-mode="true"
    @tobottom="onScrollToBottom"
  />
</template>

<script>
import VirtualList from "vue-virtual-scroll-list";
import ReportItem from "../components/ReportItem.vue";

export default {
  props: {
    host: String,
    items: {
      type: Array,
      default() {
        return [];
      },
    },
  },
  data() {
    return {
      page: 1,
      itemComponent: ReportItem,
    };
  },
  methods: {
    onScrollToBottom() {
      this.$emit("fetch", {
        page: this.page + 1,
        onSuccess: (page) => {
          this.page = page;
        },
      });
    },
  },
  mounted() {
    this.$emit("fetch", { page: this.page });
  },
  components: { VirtualList },
};
</script>
  