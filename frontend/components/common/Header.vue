<template>
  <v-app-bar app color="primary" height="64">
    <div class="d-flex align-center">
      <v-img
        alt="Vuetify Logo"
        class="shrink mr-2"
        contain
        src="https://cdn.vuetifyjs.com/images/logos/vuetify-logo-dark.png"
        transition="scale-transition"
        width="40"
      />

      <v-img
        alt="Vuetify Name"
        class="shrink mt-1 hidden-sm-and-down"
        contain
        min-width="100"
        src="https://cdn.vuetifyjs.com/images/logos/vuetify-name-dark.png"
        width="100"
      />
      <v-spacer></v-spacer>
      <v-tabs background-color="primary" height="64" dark grow>
        <v-tab nuxt to="/" class="white--text">Home</v-tab>
        <v-tab nuxt to="/play" class="white--text">Play</v-tab>
        <v-tab nuxt to="/request" class="white--text">Request</v-tab>
        <v-tab nuxt to="/table" class="white--text">Table</v-tab>
        <!-- <v-tab>
          <NuxtLink class="white--text font-small" to="/admin/requests"
            >admin
          </NuxtLink>
        </v-tab> -->
      </v-tabs>
    </div>
    <div class="d-flex align-center ml-auto">
      <NuxtLink
        v-if="this.$auth.loggedIn"
        to="/mypage"
        class="d-flex align-center"
      >
        <!-- TODO: S3で画像アップロード出来たらDBからの取得に書き換える -->
        <v-img
          :src="this.$auth.$state.user.picture"
          width="56"
        />
        <v-list-item two-line>
          <v-list-item-content class="white--text">
            <v-list-item-title>{{ user.name }}</v-list-item-title>
            <v-list-item-subtitle class="d-flex align-center white--text">
              <p class="mb-0 mr-3">{{ `Lv.${user.level}` }}</p>
              <v-progress-linear
                :value="expGuage"
                color="amber"
                height="20"
                class="justify-start"
              >
                <template v-slot:default>
                  <strong class="justify-start">{{ `${user.point}/${user.maxPoint}回` }}</strong>
                </template>
              </v-progress-linear>
            </v-list-item-subtitle>
            <!-- <v-list-item-subtitle class="white--text">{{ `${user.point} / ${user.maxPoint}` }}</v-list-item-subtitle> -->
          </v-list-item-content>
        </v-list-item>
      </NuxtLink>
      <v-btn
        v-if="!this.$auth.loggedIn"
        type="primary"
        @click="loginWithAuthZero"
        class="ml-5"
      >ログイン</v-btn>
      <v-btn
        v-if="this.$auth.loggedIn"
        type="primary"
        @click="logoutWithAuthZero"
        class="ml-5"
      >ログアウト</v-btn>
    </div>
  </v-app-bar>
</template>

<script>
export default {
  data: () => ({
    user: {}
  }),
  created() {
    this.user = this.$store.getters['user/all']
  },
  computed: {
    expGuage() {
      return this.user.point / this.user.maxPoint * 100
    }
  },
  methods: {
    loginWithAuthZero() {
      this.$auth.loginWith('auth0')
    },
    async logoutWithAuthZero() {
      try {
        await this.$store.dispatch('user/setIsLogouting', 'success')
        await this.$store.dispatch('user/resetAll')
        await this.$auth.logout()
      } catch(err) {
        console.log(err)
        const msgObj = {
          content: 'ログアウトできませんでした。しばらく経ってから再度お試しください。',
          type: 'error'
        }
        this.$store.dispatch('flashMessage/setAll', msgObj)
      }
    }
  }
}
</script>
