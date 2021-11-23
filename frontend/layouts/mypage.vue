<template>
  <v-app>
    <Header />
    <v-main>
      <v-container>
        <v-row>
          <v-col cols="3">
            <v-sheet rounded="lg">
              <v-list color="transparent">
                <v-list-item
                  v-for="item in items"
                  :key="item"
                  nuxt
                  :to="item.route"
                >
                  <v-list-item-content>
                    <v-list-item-title>
                      {{ item.name }}
                    </v-list-item-title>
                  </v-list-item-content>
                </v-list-item>
              </v-list>
            </v-sheet>
          </v-col>

          <v-col>
            <v-sheet
              min-height="70vh"
              rounded="lg"
            >
              <Nuxt />
            </v-sheet>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Header from '@/components/common/Header'

export default {
  components: {
    Header
  },
  data: () => ({
    items: [
      { name: '累積データ', route: '/mypage/dataview'},
      { name: 'アカウント設定', route: '/mypage/config'},
    ]
  })
}
</script>
