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
        const msgObj = {
          content: res.content,
          type: res.status
        }
        this.$store.dispatch('flashMessage/setAll', msgObj)

        const userObj = JSON.parse(res.user)
        this.$store.dispatch('user/setAll', userObj)

        this.$router.push('/')
      })
      .catch((err) => {
        console.log('エラーが発生しました', err)
        this.$store.dispatch('user/setIsLogouting', 'error')
        this.$store.dispatch('user/resetAll')
        this.$auth.logout()
      })
  }
}
</script>
