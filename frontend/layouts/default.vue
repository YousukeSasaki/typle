<template>
  <v-app>
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
        <template v-if="this.$auth.loggedIn">
          <v-img
            :src="this.$auth.$state.user.picture"
            width="56"
          />
          <p class="mb-0 ml-3 white--text">{{ this.$auth.$state.user.name }}</p>
        </template>
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
    <v-main>
      <v-row class="text-center">
        <v-col class="mb-4">
          <Nuxt />
        </v-col>
      </v-row>
    </v-main>
  </v-app>
</template>

<script>
export default {
  data() {
    return {
      clipped: false,
      drawer: false,
      fixed: false,
      items: [
        {
          icon: 'mdi-apps',
          title: 'Welcome',
          to: '/'
        },
        {
          icon: 'mdi-chart-bubble',
          title: 'Inspire',
          to: '/inspire'
        }
      ],
      miniVariant: false,
      right: true,
      rightDrawer: false,
      title: 'Vuetify.js'
    }
  },
  created() {
    console.log(this.$auth)
  },
  methods: {
    loginWithAuthZero() {
      this.$auth.loginWith('auth0')
    },
    async logoutWithAuthZero() {
      await this.$auth.logout()
    },
  }
}
</script>
