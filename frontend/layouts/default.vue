<template>
  <v-app>
    <Header />
    <v-main>
      <v-container class="py-0">
        <FlashMessage />
        <Nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import FlashMessage from '@/components/common/FlashMessage'
import Header from '@/components/common/Header'

export default {
  name: 'default',
  middleware: 'flashMessage',
  components: {
    FlashMessage,
    Header
  }
}
</script>
