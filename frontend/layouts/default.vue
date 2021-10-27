<template>
  <v-app>
    <v-app-bar app color="primary" height="64" dark>
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
        <v-tabs background-color="primary" height="64" dark>
          <v-tab>
            <router-link to="/" class="white--text">Home</router-link>
          </v-tab>
          <v-tab>
            <router-link to="/play" class="white--text">Play</router-link>
          </v-tab>
          <v-tab>
            <router-link to="/request" class="white--text">Request</router-link>
          </v-tab>
          <v-tab>
            <router-link to="/table" class="white--text">Table</router-link>
          </v-tab>
          <!-- <v-tab>
            <router-link class="white--text font-small" to="/admin/requests"
              >admin
            </router-link>
          </v-tab> -->
        </v-tabs>
      </div>
    </v-app-bar>
    <Nuxt />
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
  }
}
</script>
