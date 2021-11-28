<template>
  <v-sheet rounded="lg">
    <v-navigation-drawer permanent floating>
      <v-list>
        <v-list-item>
          <v-list-item-avatar size="60">
            <!-- TODO: S3で画像アップロード出来たらDBからの取得に書き換える -->
            <v-img :src="this.$auth.$state.user.picture"></v-img>
          </v-list-item-avatar>
        </v-list-item>

        <v-list-item>
          <v-list-item-content>
            <v-list-item-title class="text-h6">
              {{ user.name }}
            </v-list-item-title>
            <!-- <v-list-item-subtitle>john@vuetifyjs.com</v-list-item-subtitle> -->
          </v-list-item-content>
        </v-list-item>
      </v-list>
      <v-divider></v-divider>
      <v-list
        nav
        dense
      >
        <v-list-item-group
          color="primary"
        >
          <v-list-item
            v-for="(item, i) in items"
            :key="i"
            nuxt
            :to="item.route"
          >
            <v-list-item-icon>
              <v-icon v-text="item.icon"></v-icon>
            </v-list-item-icon>

            <v-list-item-content>
              <v-list-item-title v-text="item.name"></v-list-item-title>
            </v-list-item-content>
          </v-list-item>
        </v-list-item-group>
      </v-list>
    </v-navigation-drawer>
  </v-sheet>
</template>

<script>
export default {
  data: () => ({
    items: [
      { key: 'dataview', name: '累計データ', route: '/mypage/dataview', icon: 'mdi-folder'},
      { key: 'config', name: 'アカウント設定', route: '/mypage/config', icon: 'mdi-account-multiple'},
    ]
  }),
  computed: {
    user() {
      return this.$store.getters['user/all']
    }
  },
}
</script>
