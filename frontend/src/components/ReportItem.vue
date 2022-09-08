<template>
  <div class="p-3">
    <h2 class="text-xl mt-3 font-medium">
      {{ index + 1 }}. {{ source.protocol }}://{{ host }}:{{ source.port }}
    </h2>

    <!-- plugin info -->
    <div
      class="
        p-4
        my-4
        text-sm text-blue-700
        bg-blue-100
        rounded-lg
        dark:bg-blue-200 dark:text-blue-800
      "
      role="alert"
    >
      <svg
        aria-hidden="true"
        class="flex-shrink-0 inline w-5 h-5 mr-3"
        fill="currentColor"
        viewBox="0 0 20 20"
        xmlns="http://www.w3.org/2000/svg"
      >
        <path
          fill-rule="evenodd"
          d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7-4a1 1 0 11-2 0 1 1 0 012 0zM9 9a1 1 0 000 2v3a1 1 0 001 1h1a1 1 0 100-2v-3a1 1 0 00-1-1H9z"
          clip-rule="evenodd"
        ></path>
      </svg>
      <span class="sr-only">Info</span>
      <span class="font-medium">Plugin info</span>
      {{ source.plugin.plugin_family.name }} / {{ source.plugin.nessus_id }}:
      {{ source.plugin.name }} ({{ source.plugin.version }})
    </div>

    <!-- important props -->
    <p class="mt-4 leading-8">
      <PropBadge
        :color="prop.color"
        :name="prop.name | snakeToTitleCase"
        :value="source[prop.name] | snakeToTitleCase"
        v-for="prop in [
          { color: 'blue', name: 'svc_name' },
          { color: 'red', name: 'severity' },
          { color: 'yellow', name: 'risk_factor' },
        ]"
        :key="prop.name"
      />
    </p>

    <!-- explanatory props -->
    <dl
      class="
        text-gray-900
        divide-y divide-gray-200
        dark:text-white dark:divide-gray-700
        mt-3
      "
    >
      <div
        class="flex flex-col pb-3"
        v-for="prop in ['synopsis', 'description', 'output', 'solution']"
        :key="prop"
      >
        <dt class="mb-1 font-medium text-gray-500 dark:text-gray-400">
          {{ prop | snakeToTitleCase }}
        </dt>
        <dd class="font-light">{{ source[prop] }}</dd>
      </div>
    </dl>
  </div>
</template>

<script>
import PropBadge from "./PropBadge.vue";

export default {
  props: {
    index: {
      type: Number,
    },
    host: String,
    source: {
      type: Object,
      default() {
        return {};
      },
    },
  },
  components: { PropBadge },
};
</script>
  