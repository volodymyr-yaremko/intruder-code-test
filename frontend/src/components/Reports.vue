<template>
  <div class="flex justify-center mt-4">
    <FileUploader
      @uploaded="nessusFileUploaded"
      upload-url="https://httpbin.org/post"
    />
  </div>
</template>

<script>
import FileUploader from "./FileUploader.vue";

export default {
  name: "Reports",
  components: { FileUploader },
  methods: {
    nessusFileUploaded() {
      console.log("uploaded!!!");
    },
  },
};
</script>
