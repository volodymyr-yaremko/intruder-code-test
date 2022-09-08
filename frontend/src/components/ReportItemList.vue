<template>
  <virtual-list
    scrollable
    :data-key="'id'"
    :data-sources="items"
    :data-component="itemComponent"
    :extra-props="{ host }"
    :page-mode="true"
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
      itemComponent: ReportItem,
    };
  },
  components: { VirtualList },
};
</script>
  