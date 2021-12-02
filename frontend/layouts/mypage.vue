<template>
  <v-app>
    <Header />
    <v-main>
      <v-container>
        <FlashMessage />
        <v-row>
          <v-col cols="3">
            <SideNav />
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
import FlashMessage from '@/components/common/FlashMessage'
import Header from '@/components/common/Header'
import SideNav from '@/components/common/mypage/SideNav'

export default {
  name: "mypage",
  middleware: 'flashMessage',
  components: {
    FlashMessage,
    Header,
    SideNav
  }
}
</script>
