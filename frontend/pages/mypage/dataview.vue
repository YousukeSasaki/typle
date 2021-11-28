<template>
  <v-container>
    <h1 class="mb-7">累計データ</h1>
    <v-row>
      <v-col
        cols="4"
      >
        <v-menu
          v-model="showFromCalender"
          :close-on-content-click="false"
          :nudge-right="40"
          transition="scale-transition"
          offset-y
          min-width="auto"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-text-field
              v-model="fromDateFormatted"
              label="開始"
              prepend-icon="mdi-calendar"
              readonly
              v-bind="attrs"
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="fromDate"
            no-title
            @input="showFromCalender = false"
          ></v-date-picker>
        </v-menu>
      </v-col>
      <v-col
        cols="4"
      >
        <v-menu
          v-model="showToCalender"
          :close-on-content-click="false"
          :nudge-right="40"
          transition="scale-transition"
          offset-y
          min-width="auto"
        >
          <template v-slot:activator="{ on, attrs }">
            <v-text-field
              v-model="toDateFormatted"
              label="終了"
              prepend-icon="mdi-calendar"
              readonly
              v-bind="attrs"
              v-on="on"
            ></v-text-field>
          </template>
          <v-date-picker
            v-model="toDate"
            no-title
            @input="showToCalender = false"
          ></v-date-picker>
        </v-menu>
      </v-col>
      <v-col>
        <v-btn
          class="text-right"
          :disabled="loading"
          color="secondary"
          @click="getResults"
        >
          絞り込み
        </v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        プレイ回数
      </v-col>
      <v-col cols="8">
        {{ results.counts }}回
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        プレイ時間
      </v-col>
      <v-col cols="8">
        {{ results.times }}秒
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        合計タイプ数
      </v-col>
      <v-col cols="8">
        {{ results.total }}key
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        ボーナス問題正解タイプ数
      </v-col>
      <v-col cols="8">
        {{ results.bonusCorrects }}key
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        ノーマル問題正解タイプ数
      </v-col>
      <v-col cols="8">
        {{ results.normalCorrects }}key
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        ミスタイプ数
      </v-col>
      <v-col cols="8">
        {{ results.wrongs }}key
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        精度
      </v-col>
      <v-col cols="8">
        {{ results.accuracy }}%
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="4">
        スコア
      </v-col>
      <v-col cols="8">
        {{ results.scores }}点
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
import { dateToFormatString } from '@/plugins/dateToFormatString'

export default {
  layout: 'mypage',
  data: () => ({
    results: {},
    fromDate: dateToFormatString(new Date('2021-11-01'), '%YYYY%-%MM%-%DD%'),
    toDate: dateToFormatString(new Date(Date.now()), '%YYYY%-%MM%-%DD%'),
    fromDateFormatted: '2021/11/01',
    toDateFormatted: dateToFormatString(new Date(Date.now()), '%YYYY%/%MM%/%DD%'),
    showFromCalender: false,
    showToCalender: false,
    loading: false
  }),
  watch: {
    fromDate(val) {
      this.fromDateFormatted = this.formatDate(val)
    },
    toDate(val) {
      this.toDateFormatted = this.formatDate(val)
    }
  },
  computed: {
    user() {
      return this.$store.getters['user/all']
    }
  },
  created() {
    this.getResults()
  },
  methods: {
    toggleFromCalender() {
      this.showFromCalender = !this.showFromCalender
    },
    formatDate (date) {
      if (!date) return null

      return date.replaceAll('-', '/')
    },
    getResults() {
      const params = { from: this.fromDate, to: this.toDate }
      this.$axios.$get(`/users/${this.user.id}/dataview`, { params: params })
        .then((res) => {
          this.results = JSON.parse(res.results)
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
