<template>
  <label
    class="
      w-64
      flex flex-col
      items-center
      px-4
      py-6
      text-blue
      rounded-lg
      shadow-lg
      tracking-wide
      border border-blue
      cursor-pointer
    "
    :class="
      uploading ? 'bg-gray-200' : 'bg-white hover:bg-blue-600 hover:text-white'
    "
    @click="uploading && $event.preventDefault()"
  >
    <svg
      class="w-8 h-8"
      fill="currentColor"
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 20 20"
    >
      <path
        d="M16.88 9.1A4 4 0 0 1 16 17H5a5 5 0 0 1-1-9.9V7a3 3 0 0 1 4.52-2.59A4.98 4.98 0 0 1 17 8c0 .38-.04.74-.12 1.1zM11 11h3l-4-4-4 4h3v3h2v-3z"
      />
    </svg>
    <span class="mt-2 text-base leading-normal uppercase">
      {{ uploading ? "Uploading..." : "Select a file" }}
    </span>
    <BaseProgress
      :percentage="uploadPercentage"
      class="mx-2 my-2"
      v-if="uploading"
    />
    <input type="file" class="hidden" @change="uploadFile($event)" />
  </label>
</template>

<script>
import axios from "axios";
import BaseProgress from "./BaseProgress.vue";

export default {
  data() {
    return {
      uploading: false,
      uploadPercentage: 0,
    };
  },
  props: {
    uploadUrl: String,
  },
  methods: {
    uploadFile(e) {
      const file = e.target.files[0];
      const formData = new FormData();
      formData.append("file", file);

      this.uploading = true;
      axios
        .post(this.uploadUrl, formData, {
          headers: { "Content-Type": "multipart/form-data" },
          onUploadProgress: function (progressEvent) {
            this.uploadPercentage = parseInt(
              Math.round((progressEvent.loaded / progressEvent.total) * 100)
            );
          }.bind(this),
        })
        .then((res) => {
          this.$emit("uploaded");
          return;
        })
        .finally(() => {
          this.uploading = false;
        });
    },
  },
  components: { BaseProgress },
};
</script>