<template>
  <v-container>
    <v-form>
      <v-btn type="primary" @click="loginWithAuthZero">ログイン
      </v-btn>
    </v-form>
  </v-container>
</template>

<script>
export default {
  methods: {
    loginWithAuthZero() {
      this.$auth.loginWith('auth0')
    }
  }
}
</script>
