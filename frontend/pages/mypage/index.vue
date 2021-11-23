<template>
  <v-container>
    <h1>こんにちは、{{ this.$auth.$state.user.family_name }}さん!</h1>
  </v-container>
</template>

<script>
export default {
  layout: 'mypage'
}
</script>
