<template>
  <v-app>
    <Header />
    <v-main>
      <v-container class="py-0">
        <Nuxt />
      </v-container>
    </v-main>
  </v-app>
</template>

<script>
import Header from '@/components/common/Header'

export default {
  components: {
    Header
  }
}
</script>
