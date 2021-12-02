<template>
  <v-alert
    v-model="isOpen"
    :type="message.type ||'success'"
    elevation="8"
    dismissible
    :class="$style.message"
    class="container"
  >
    {{ message.content }}
  </v-alert>
</template>

<script>
export default {
  data: () => ({
    isOpen: false,
  }),
  watch: {
    isOpen(v) {
      if (!v) {
        this.$store.dispatch('flashMessage/resetAll')
      }
    },
    message: {
      handler(v) {
        this.isOpen = !!v.content
      },
      deep: true,
      immediate: true
    }
  },
  computed: {
    message() {
      return this.$store.getters['flashMessage/all']
    }
  }
}
</script>

<style lang="scss" module>
div.message {
  position: absolute;
  top: 20px;
  z-index: 999;
  margin-bottom: 0;
  width: calc(100% - 24px);
}
</style>
