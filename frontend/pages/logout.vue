<template>
  <v-container>
    <div>
      <h1 class="title">sample-nuxt-auth</h1>
      <h2 class="subtitle">ログアウトしました</h2>
    </div>
  </v-container>
</template>

<script>
export default {
  created() {
    this.$store.dispatch('user/resetAll')
  }
}
</script>
