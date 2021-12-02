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
        const userObj = JSON.parse(res.user)
        this.$store.dispatch('user/setAll', userObj)

        const msgObj = {
          content: res.content,
          type: res.status
        }
        this.$store.dispatch('flashMessage/setAll', msgObj)

        this.$router.push('/')
      })
      .catch((err) => {
        console.log('エラーが発生しました', err)
      })
  }
}
</script>
