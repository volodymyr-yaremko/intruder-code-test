<template>
  <div class="flex justify-center mt-4">
    <FileUploader
      @uploaded="nessusFileUploaded"
      upload-url="http://localhost:3000/api/v1/nessus/upload"
    />
  </div>
</template>

<script>
import FileUploader from "../components/FileUploader.vue";

export default {
  name: "Reports",
  components: { FileUploader },
  methods: {
    nessusFileUploaded(report) {
      this.$router.push(`/reports/${report.id}`);
    },
  },
};
</script>
