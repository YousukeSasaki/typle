<template>
  <div class="">
    <RequestsManagementTable />
  </div>
</template>

<script>
import RequestsManagementTable from "@/components/RequestsManagementTable.vue";

export default {
  name: "AdminRequestsIndex",
  components: {
    RequestsManagementTable
  }
};
</script>
