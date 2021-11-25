<template>
  <div>

  </div>
</template>

<script>
export default {
  created() {
    const user = this.$auth.$state.user
    this.$axios.$patch('/users/login_create', { user })
      .then((res) => {
        const user_obj = JSON.parse(res.user)
        this.$store.dispatch('user/setAll', user_obj)

        this.$router.push('/')
      })
      .catch((err) => {
        console.log('エラーが発生しました', err)
      })
  }
}
</script>
