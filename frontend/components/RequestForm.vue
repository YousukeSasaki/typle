<template>
  <v-row class="text-center">
    <v-col class="mb-4">
      <div :class="$style.container">
        <v-form ref="form" v-model="valid" lazy-validation>
          <v-text-field
            v-model="question"
            :counter="30"
            :rules="questionRules"
            label="問題"
            hint="（例）タイピングに自信あり！"
            required
          ></v-text-field>

          <v-text-field
            v-model="kana"
            :counter="60"
            :rules="kanaRules"
            label="ひらがな"
            placeholder="（例）たいぴんぐにじしんあり！"
            required
          ></v-text-field>

          <v-select
            v-model="select"
            :items="items"
            item-text="ja"
            item-value="en"
            :rules="selectRules"
            label="ジャンル"
            required
          ></v-select>

          <v-btn
            :disabled="!valid"
            color="success"
            class="mr-4"
            @click="submitRequest"
          >
            送信
          </v-btn>

          <v-btn color="error" class="mr-4" @click="reset">
            クリア
          </v-btn>
        </v-form>
      </div>
    </v-col>
  </v-row>
</template>

<script>
// import firebase from "firebase";
// import "firebase/firestore";

// const db = firebase.firestore();

export default {
  data() {
    return {
      valid: true,
      alert: false,
      question: '',
      questionRules: [
        (v) => !!v || '問題は必須です',
        (v) => (v && v.length <= 30) || '30文字以内で入力してください'
      ],
      kana: '',
      kanaRules: [
        (v) => !!v || '問題は必須です',
        (v) => (v && v.length <= 60) || '60文字以内で入力してください'
      ],
      select: 'engineer',
      items: this.$genreList,
      selectRules: [(v) => !!v || 'ジャンルを選択してください']
    }
  },
  methods: {
    submitRequest() {
      if (this.$refs.form.validate()) {
        const requestData = {
          kana: this.kana,
          preview: this.question,
          createdAt: firebase.firestore.FieldValue.serverTimestamp(),
          updatedAt: firebase.firestore.FieldValue.serverTimestamp()
        }
        // db.collection('requests')
        //   .doc('genre')
        //   .collection(this.select)
        //   .add(requestData)
        //   .then(() => {
        //     this.$refs.form.reset()
        //   })
        //   .catch((err) => {
        //     console.log('error', err)
        //   })
      }
    },
    reset() {
      this.$refs.form.reset()
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
