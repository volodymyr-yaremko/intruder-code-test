<template>
  <!-- bg-blue-100 text-blue-800 dark:bg-blue-200 dark:text-blue-800 -->
  <!-- bg-gray-100 text-gray-800 dark:bg-gray-200 dark:text-gray-800 -->
  <!-- bg-red-100 text-red-800 dark:bg-red-200 dark:text-red-800 -->
  <!-- bg-yellow-100 text-yellow-800 dark:bg-yellow-200 dark:text-yellow-800 -->
  <span
    :class="`
      bg-${color}-100
      text-${color}-800 text-sm
      mr-2
      px-2.5
      py-0.5
      rounded
      dark:bg-${color}-200 dark:text-${color}-800
    `"
  >
    <span class="font-medium">[{{ name }}]</span>&nbsp;{{ value }}
  </span>
</template>

<script>
export default {
  props: {
    name: String,
    value: String,
    color: {
      type: String,
      validator(value) {
        return ["blue", "gray", "red", "yellow"].includes(value);
      },
    },
  },
};
</script>