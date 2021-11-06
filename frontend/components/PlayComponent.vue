<template>
  <div v-show="show" :class="$style.container" transition="fade-transition">
    <div v-if="showingPage === 'countDown'" :class="$style['center-wrapper']">
      <p :class="$style.count">{{ countDownNumber }}</p>
    </div>
    <div v-if="showingPage === 'playing'" :class="$style['wide-wrapper']">
      <div :class="[$style.timer, $style.first]"></div>
      <div :class="[$style.timer, $style.second]"></div>
      <p :class="$style['timer-number']">{{ passSec }}</p>
      <div :class="$style['inner-wrapper']">
        <p :class="$style.question">{{ preview }}</p>
        <p :class="$style['input-line']">
          <span :class="$style.prev">{{ prev }}</span>
          <span :class="$style.current">{{ current }}</span>
          <span :class="$style.next">{{ next }}</span>
        </p>
        <div class="d-flex justify-center">
          <p :class="$style.result">
            <v-icon dark left>
              mdi-circle-outline
            </v-icon>
            <span>{{ correctKeyCountNormal }}</span>
            <v-icon dark left>
              mdi-star-circle
            </v-icon>
            <span>{{ correctKeyCountBonus }}</span>
          </p>
          <p :class="$style.result">
            <v-icon dark left>
              mdi-close-outline
            </v-icon>
            <span>{{ wrongKeyCount }}</span>
          </p>
        </div>

        <p :class="$style.result">正確率: {{ correctRate * 100 }}%</p>
        <p :class="$style.result">平均タイプ数: {{ kps }}回/秒</p>
        <p :class="$style.result">スコア: {{ score }}</p>
      </div>
    </div>
    <div v-if="showingPage === 'result'" :class="$style['wide-wrapper']">
      <p :class="$style.result">正解タイプ数: {{ totalCorrectKeyCount }}</p>
      <p :class="$style.result">ミスタイプ数: {{ wrongKeyCount }}</p>
      <p :class="$style.result">正確率: {{ correctRate * 100 }}%</p>
      <p :class="$style.result">平均タイプ数: {{ kps }}回/秒</p>
      <p :class="$style.result">スコア: {{ score }}</p>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    genre: {
      type: String
    }
  },
  data() {
    return {
      show: false,
      showingPage: 'countDown',
      allQuestionsLength: 0,
      eventListeners: {},
      countDownThreeObj: null,
      timerObj: null,
      correctKeyCountNormal: 0, // の正解キータイプ数(通常問題)
      correctKeyCountBonus: 0, // 正解キータイプ数(ボーナス問題)
      wrongKeyCount: 0, // 不正解キータイプ数
      stockQuestionArr: [],
      kanaArr: [], // 平仮名を１文字ずつ配列に格納
      romanArr: [], // ローマ字を平仮名ごとに配列に格納
      previewArr: [], // 画面に表示されるローマ字を配列に格納
      inputKey: '',
      currentQuestion: null,
      preview: '',
      prev: '',
      current: '',
      next: '',
      countDownNumber: 3,
      passSec: 600
    }
  },
  computed: {
    totalCorrectKeyCount() {
      return this.correctKeyCountNormal + this.correctKeyCountBonus
    },
    totalKeyCount() {
      return this.correctKeyCountNormal + this.correctKeyCountBonus + this.wrongKeyCount
    },
    correctRate() {
      if (this.totalKeyCount === 0) {
        return 0
      }
      return this.totalCorrectKeyCount / this.totalKeyCount
    },
    kps() {
      if ((this.totalCorrectKeyCount) === 0) {
        return 0
      }
      return (this.totalCorrectKeyCount / (600 - this.passSec)).toFixed(1)
    },
    score() {
      if (this.correctRate === 0) {
        return 0
      }
      return Math.floor((this.correctKeyCountNormal * 10 + this.correctKeyCountBonus * 20) * this.correctRate)
    }
  },
  watch: {
    countDownNumber(v) {
      if (v === 0) {
        clearInterval(this.countDownThreeObj)
        this.showingPage = 'playing'
        this.startGame()
      }
    },
    passSec(v) {
      if (v === 0) {
        window.removeEventListener(
          'keypress',
          this.eventListeners.inputKeyEvent
        )
        clearInterval(this.timerObj)
        this.showingPage = 'result'
      }
    }
  },
  beforeDestroy() {
    window.removeEventListener('keypress', this.eventListeners.inputKeyEvent)
  },
  methods: {
    initMethods() {
      this.show = true
      this.countDownThree()
      this.getQuestions()
    },
    countDownThree() {
      const self = this
      this.countDownThreeObj = setInterval(function() {
        self.countDownNumber--
      }, 1000)
    },
    getQuestions() {
      this.$axios.$get('/questions', { params: { genre: this.genre } })
        .then((res) => {
          const questions = JSON.parse(res.data)
          questions.forEach((question, i) => {
            if (i === 0) {
              this.setQuestions(question)
            } else if ([1, 2].includes(i)) {
              question.bonus = false
              this.stockQuestionArr.push(question)
            } else {
              // 0〜3の中からランダムで数値を取得し、1/4の確率でボーナス問題とする
              const rand = Math.floor(Math.random() * 4)
              question.bonus = rand === 0
              this.stockQuestionArr.push(question)
            }
          })
        })
        .catch((err) => {
          console.log('エラーが発生しました', err)
        })
    },
    startGame() {
      this.eventListeners.inputKeyEvent = (e) => this.inputKeyEvent(e)
      const self = this
      this.timerObj = setInterval(function() {
        self.passSec--
      }, 1000)
      window.addEventListener('keypress', this.eventListeners.inputKeyEvent)
    },
    setQuestions(question) {
      this.currentQuestion = question
      this.preview = question.preview
      this.kanaSplit(question.kana)
      this.translateToRoman()
      this.initialCurrentQuestion()
    },
    kanaSplit(kana) {
      let i = 0
      while (i < kana.length) {
        const uni = kana[i]

        if (i + 1 < kana.length) {
          var bi = kana[i] + kana[i + 1]
        } else {
          bi = ''
        }

        const hasBi = this.$dictionary.some((row) => {
          return row.kana === bi
        })

        if (hasBi) {
          this.kanaArr.push(bi)
          i += 2
        } else {
          this.kanaArr.push(uni)
          i++
        }
      }
    },
    translateToRoman() {
      const concatTwoLengthWordRoman = (result, fstResult, sndResult) => {
        const concatArr = []

        // 2文字（例「ちゃ」）のローマ字
        result.alp.forEach((item) => concatArr.push(item))

        // 1文字ずつ（例「ち」+「ゃ」）のローマ字
        fstResult.alp.forEach((fstAlp) => {
          sndResult.alp.forEach((sndAlp) => {
            const concatAlp = fstAlp + sndAlp
            concatArr.push(concatAlp)
          })
        })
        return concatArr
      }

      let i = 0
      while (i < this.kanaArr.length) {
        const kana = this.kanaArr[i]
        const fst = kana[0]
        const snd = kana[1]
        const next = this.kanaArr[i + 1]
        const result = this.$dictionary.find((row) => {
          return row.kana === kana
        })
        const nextResult = this.$dictionary.find((row) => {
          return row.kana === next
        })
        const fstResult = this.$dictionary.find((row) => {
          return row.kana === fst
        })
        const sndResult = this.$dictionary.find((row) => {
          return row.kana === snd
        })
        const tmpArr = []

        if (kana.length == 2) {
          tmpArr.push(...concatTwoLengthWordRoman(result, fstResult, sndResult))
          i++
        } else {
          // 次の文字が母音・nで始まる音でない
          // 最終文字でもない「ん」
          if (
            kana === 'ん' &&
            !this.$invalidSingleN.includes(next) &&
            next !== undefined
          ) {
            // ["n", "nn", "xn"]
            const nArr = ['n', ...result.alp]
            if (next.length == 2) {
              // 「ん」と2文字の組み合わせ（例「ん」と「ちゃ」）
              const nextFst = next[0]
              const nextSnd = next[1]
              const nextFstResult = this.$dictionary.find((row) => {
                return row.kana === nextFst
              })
              const nextSndResult = this.$dictionary.find((row) => {
                return row.kana === nextSnd
              })
              const concatArr = [
                ...concatTwoLengthWordRoman(
                  nextResult,
                  nextFstResult,
                  nextSndResult
                )
              ]
              nArr.forEach((fstAlp) => {
                concatArr.forEach((sndAlp) => {
                  const concatAlp = fstAlp + sndAlp
                  tmpArr.push(concatAlp)
                })
              })
              i += 2
            } else {
              nArr.forEach((fstAlp) => {
                nextResult.alp.forEach((sndAlp) => {
                  const concatAlp = fstAlp + sndAlp
                  tmpArr.push(concatAlp)
                })
              })
              i += 2
            }
          } else if (kana === 'っ') {
            const sndAlpSet = new Set()
            nextResult.alp.forEach((sndAlp) => {
              sndAlpSet.add(sndAlp[0])
            })
            if (next.length == 2) {
              // 「っ」と2文字の組み合わせ（例「っ」と「ちゃ」）
              const nextFst = next[0] // 「ち」
              const nextSnd = next[1] // 「ゃ」
              const nextFstResult = this.$dictionary.find((row) => {
                return row.kana === nextFst
              })
              const nextSndResult = this.$dictionary.find((row) => {
                return row.kana === nextSnd
              })
              const concatArr = [
                ...concatTwoLengthWordRoman(
                  nextResult,
                  nextFstResult,
                  nextSndResult
                )
              ]
              ;[...sndAlpSet].forEach((fstAlp) => {
                concatArr.forEach((sndAlp) => {
                  if (fstAlp === sndAlp[0]) {
                    const concatAlp = fstAlp + sndAlp
                    tmpArr.push(concatAlp)
                  }
                })
              })
              result.alp.forEach((fstAlp) => {
                concatArr.forEach((sndAlp) => {
                  const concatAlp = fstAlp + sndAlp
                  tmpArr.push(concatAlp)
                })
              })
            } else {
              ;[...sndAlpSet].forEach((fstAlp) => {
                nextResult.alp.forEach((sndAlp) => {
                  if (fstAlp === sndAlp[0]) {
                    const concatAlp = fstAlp + sndAlp
                    tmpArr.push(concatAlp)
                  }
                })
              })
              result.alp.forEach((fstAlp) => {
                nextResult.alp.forEach((sndAlp) => {
                  const concatAlp = fstAlp + sndAlp
                  tmpArr.push(concatAlp)
                })
              })
            }
            i += 2
          } else {
            result.alp.forEach((item) => {
              tmpArr.push(item)
            })
            i++
          }
        }
        this.romanArr.push(tmpArr)
      }
    },
    initialCurrentQuestion() {
      for (let i = 0; i < this.romanArr.length; i++) {
        this.previewArr.push(this.romanArr[i][0])
        if (i === 0) {
          this.current = this.romanArr[0][0].slice(0, 1)
          this.next += this.romanArr[0][0].slice(1)
        } else {
          this.next += this.romanArr[i][0]
        }
      }
    },
    resetQuestion() {
      this.kanaArr = []
      this.prev = ''
    },
    inputKeyEvent(e) {
      this.inputKey = String.fromCharCode(e.keyCode)
      const curArr = this.romanArr[0]
      let isCorrect
      if (curArr) {
        isCorrect = curArr.some((item) => {
          return item[0] === this.inputKey
        })
      }
      if (isCorrect) {
        let i = 0
        while (i < curArr.length) {
          if (this.inputKey === curArr[i][0]) {
            curArr[i] = curArr[i].slice(1)
            if (curArr[i].length === 0) {
              curArr.splice(i, 1)
            } else {
              i++
            }
          } else {
            curArr.splice(i, 1)
          }
        }
        for (let i = 0; i < this.romanArr.length; i++) {
          this.previewArr[i] = this.romanArr[i][0]
          i++
        }
        if (curArr.length === 0) {
          this.romanArr.shift()
          this.previewArr.shift()
        }
        let still = ''
        this.previewArr.forEach((str) => {
          still += str
        })
        this.prev = this.prev + this.inputKey
        this.current = still[0]
        this.next = still.slice(1)
        if (!this.current) {
          this.resetQuestion()
          this.setQuestions(this.stockQuestionArr[0])
          this.stockQuestionArr.shift()
        }
        if (this.currentQuestion.bonus) {
          this.correctKeyCountBonus++
        } else {
          this.correctKeyCountNormal++
        }
      } else {
        this.wrongKeyCount++
      }
    }
  }
}
</script>

<style lang="scss" module>
.container {
  position: relative;
  max-width: 800px;
  height: calc(100vh - 110px);
  margin: 0 auto;
  background-color: #000000;
  color: #ffffff;
  text-align: center;
  font-size: 1.5rem;
}
.center-wrapper {
  position: absolute;
  width: 100%;
  top: 50%;
  left: 50%;
  transform: translateY(-50%) translateX(-50%);
  -webkit-transform: translateY(-50%) translateX(-50%);
}
.wide-wrapper {
  position: relative;
  width: 100%;
}
.timer {
  position: absolute;
  margin: 0 auto;
  border: 1px solid #ffffff;
  border-radius: 100px;
  top: -35px;
  left: 50%;
  transform: translateX(-50%);
  -webkit-transform: translateX(-50%);
  &.first {
    top: -28px;
    width: 100px;
    height: 100px;
  }
  &.second {
    top: -33px;
    width: 110px;
    height: 110px;
  }
}
.timer-number {
  font-size: 40px;
}
.inner-wrapper {
  position: absolute;
  width: 100%;
  top: 50%;
  transform: translateY(50%);
  -webkit-transform: translateY(50%);
}
.count {
  font-size: 80px;
}
.question {
  margin-bottom: 30px;
}
.input-line {
  font-family: 'Roboto Mono', monospace;
  margin-bottom: 30px;
  font-size: 0;
  .prev {
    color: #909670;
    font-size: 1.5rem;
  }
  .current {
    color: #ffffff;
    padding-bottom: 3px;
    border-bottom: 2px solid #ffffff;
    font-size: 1.5rem;
  }
  .next {
    color: #ffffff;
    font-size: 1.5rem;
  }
}
.result {
  margin-bottom: 10px;
}
</style>
