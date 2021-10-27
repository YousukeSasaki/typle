<template>
  <v-card>
    <v-card-title>
      <v-btn color="success" class="mr-4" @click="acceptRequest">
        承認
      </v-btn>
      <v-spacer></v-spacer>
      <v-select
        v-model="select"
        :items="items"
        item-text="ja"
        item-value="en"
        label="ジャンル"
        return-object
      ></v-select>
      <v-spacer></v-spacer>
      <v-text-field
        v-model="search"
        append-icon="mdi-magnify"
        label="Search"
        single-line
        hide-details
      ></v-text-field>
    </v-card-title>
    <v-data-table
      v-model="selected"
      :headers="headers"
      :items="desserts"
      :items-per-page="20"
      :loading="loading"
      show-select
    >
      <template v-slot:item.preview="props">
        <v-edit-dialog
          :return-value.sync="props.item.preview"
          large
          persistent
          @save="save"
          @cancel="cancel"
          @open="open"
        >
          <div>{{ props.item.preview }}</div>
          <template v-slot:input>
            <div class="mt-4 title">
              Update preview
            </div>
          </template>
          <template v-slot:input>
            <v-text-field
              v-model="props.item.preview"
              :rules="[max30chars]"
              label="Edit"
              single-line
              counter
              autofocus
            ></v-text-field>
          </template>
        </v-edit-dialog>
      </template>
      <template v-slot:item.kana="props">
        <v-edit-dialog
          :return-value.sync="props.item.preview"
          large
          persistent
          @save="save"
          @cancel="cancel"
          @open="open"
        >
          <div>{{ props.item.kana }}</div>
          <template v-slot:input>
            <div class="mt-4 title">
              Update kana
            </div>
          </template>
          <template v-slot:input>
            <v-text-field
              v-model="props.item.kana"
              :rules="[max50chars]"
              label="Edit"
              single-line
              counter
              autofocus
            ></v-text-field>
          </template>
        </v-edit-dialog>
      </template>
    </v-data-table>

    <v-snackbar v-model="snack" :timeout="3000" :color="snackColor">
      {{ snackText }}

      <template v-slot:action="{ attrs }">
        <v-btn v-bind="attrs" text @click="snack = false">
          Close
        </v-btn>
      </template>
    </v-snackbar>
    {{ selected }}
  </v-card>
</template>

<script>
// import firebase from 'firebase'
// import 'firebase/firestore'
import _ from 'lodash'
import { dateToFormatString } from '../plugins/dateToFormatString'

const db = []

export default {
  name: 'RequestsManagementTable',
  data() {
    return {
      loading: true,
      search: '',
      select: { ja: 'エンジニア', en: 'engineer' },
      selected: [],
      snack: false,
      snackColor: '',
      snackText: '',
      max30chars: (v) => v.length <= 30 || 'Input too long!',
      max50chars: (v) => v.length <= 50 || 'Input too long!',
      pagination: {},
      items: this.$genreListWithAll,
      headers: [
        { text: 'ジャンル', value: 'genre_ja' },
        { text: '問題', align: 'start', value: 'preview' },
        { text: 'かな', value: 'kana' },
        { text: '更新日時', value: 'updatedAt' }
      ],
      desserts: []
    }
  },
  watch: {
    select(v) {
      if (v.en === 'all') {
        this.$genreList.forEach((row) => this.setRows(row))
      } else {
        this.setRows()
      }
    }
  },
  mounted() {
    this.setRows()
  },
  methods: {
    setRows(genreObj = this.select) {
      this.loading = true
      this.desserts = []
      db.collection('requests')
        .doc('genre')
        .collection(genreObj.en)
        .get()
        .then((snapshot) => {
          snapshot.forEach((doc) => {
            const data = doc.data()
            const item = {
              id: doc.id,
              genre_ja: genreObj.ja,
              genre_en: genreObj.en,
              preview: data.preview,
              kana: data.kana,
              updatedAt: dateToFormatString(
                data.updatedAt.toDate(),
                '%YYYY%/%MM%/%DD% %HH%:%mm%:%ss%'
              )
            }
            this.desserts.push(item)
            this.loading = false
          })
        })
        .catch((err) => {
          console.log('エラーが発生しました', err)
        })
    },
    // acceptRequest() {
    //   if (this.selected !== []) {
    //     db.runTransaction(async (transaction) => {
    //       this.selected.forEach((row) => {
    //         // const numberOfQuestion = db
    //         //   .collection("numberOfQuestions")
    //         //   .doc(row.genre_en)
    //         //   .data().number;
    //         const questionDoc = db
    //           .collection('questions')
    //           .doc('genre')
    //           .collection(row.genre_en)
    //           .doc()
    //         const requestDoc = db
    //           .collection('requests')
    //           .doc('genre')
    //           .collection(row.genre_en)
    //           .doc(row.id)
    //         const createData = {
    //           preview: row.preview,
    //           kana: row.kana,
    //           createdAt: firebase.firestore.FieldValue.serverTimestamp(),
    //           updatedAt: firebase.firestore.FieldValue.serverTimestamp()
    //         }
    //         transaction.set(questionDoc, createData)
    //         transaction.delete(requestDoc)
    //       })
    //     })
    //       .then((ref) => {
    //         console.log('request succeeded!!', ref)
    //         this.desserts = _.difference(this.desserts, this.selected)
    //         this.selected = []
    //       })
    //       .catch((err) => {
    //         console.log('error', err)
    //       })
    //   } else {
    //     this.snack = true
    //     this.snackColor = 'error'
    //     this.snackText = 'Canceled'
    //   }
    // },
    save() {
      this.snack = true
      this.snackColor = 'success'
      this.snackText = '編集完了'
    },
    cancel() {
      this.snack = true
      this.snackColor = 'error'
      this.snackText = 'キャンセルしました'
    },
    open() {
      this.snack = true
      this.snackColor = 'info'
      this.snackText = 'Dialog opened'
    }
  }
}
</script>

<style lang="scss" module>
.container {
  width: 660px;
  height: 600px;
  margin: 0 auto;
  padding: 30px;
  // background-color: #000000;
  // color: #ffffff;
  text-align: center;
  font-size: 1.5rem;
}
</style>
