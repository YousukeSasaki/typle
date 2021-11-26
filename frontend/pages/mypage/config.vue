<template>
  <v-container>
    <h1 class="mb-7">アカウント設定</h1>
    <v-row>
      <v-col class="mb-4">
        <p class="mb-1">ニックネーム</p>
        <v-text-field
          v-model="user.name"
          outlined
          dense
        />
      </v-col>
    </v-row>
    <v-row>
      <v-col class="mb-4">
        <p class="mb-1">メールアドレス</p>
        <v-text-field
          v-model="user.email"
          outlined
          dense
        />
      </v-col>
    </v-row>
    <v-row>
      <v-col class="text-right">
        <v-btn
          class="text-right"
          :loading="loading"
          :disabled="loading"
          color="secondary"
          @click="submit"
        >
          更新する
        </v-btn>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  layout: 'mypage',
  data: () => ({
    user: null,
    loading: false
  }),
  created() {
    // DeepCopyを避けるためのやや破壊的な変換のため注意
    // https://www.taikishiino.com/blogs/2020/04/shallow-copy-deep-copy/
    this.user = JSON.parse(JSON.stringify(this.storeUser))
  },
  computed: {
    storeUser() {
      return this.$store.getters['user/all']
    }
  },
  methods: {
    submit() {
      this.loading = true
      this.$axios.$patch(`/users/${this.user.id}`, { user: this.user })
        .then((res) => {
          const userObj = JSON.parse(res.user)
          this.$store.dispatch('user/setAll', userObj)
        })
        .catch((err) => {
          console.log('エラーが発生しました', err)
        })
        .finally(() => {
          this.loading = false
        })
    }
  }
}
</script>
