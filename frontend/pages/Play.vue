<template>
  <div class="text-center">
    <PlayComponent
      ref="PlayComponent"
      :play-mode="playMode"
      :genre="selectedGenre"
    />
    <v-dialog v-model="genreDialog" width="500" persistent>
      <v-card>
        <v-card-title class="headline grey lighten-2 justify-space-between">
          <v-btn @click="$router.go(-1)">
            <v-icon>
              mdi-arrow-left
            </v-icon>
            戻る
          </v-btn>
          <span>ジャンル選択</span>
          <v-btn @click="toggleDialog">
            <v-icon>
              mdi-cog
            </v-icon>
            <span>設定</span>
          </v-btn>
        </v-card-title>

        <v-btn-toggle v-model="selectedGenre" class="d-block mt-6">
          <v-card-text class="pt-3">
            <v-container>
              <v-row align="center" no-gutters>
                <v-col
                  v-for="genre in genres"
                  :key="genre.value"
                  cols="12" md="6" class="mb-6 px-3"
                >
                  <v-btn
                    class="btn"
                    :class="`btn-${genre.value}`"
                    :value="genre.value">
                    <span>{{ genre.name }}</span>
                  </v-btn>
                </v-col>
              </v-row>
            </v-container>
          </v-card-text>
        </v-btn-toggle>

        <v-divider></v-divider>

        <v-card-actions class="pa-0">
          <v-btn
            class="btn-submit w-100"
            color="primary"
            @click="submitGenre"
            :disabled="disabled"
          >
            <v-icon dark left>
              mdi-checkbox-marked-circle
            </v-icon>
            決定
          </v-btn>
        </v-card-actions>
      </v-card>
    </v-dialog>

    <v-dialog v-model="settingDialog" width="500" persistent>
      <v-card>
        <v-card-title class="headline grey lighten-2 justify-space-between">
          <v-btn left @click="toggleDialog">
            <v-icon>
              mdi-arrow-left
            </v-icon>
            戻る
          </v-btn>
          <span>設定</span>
          <div style="width: 87px;"></div>
        </v-card-title>
        <v-card-text class="pt-3">
          <v-container>
            <v-row class="mb-7" align="center" no-gutters>
              <v-col cols="12" md="3" class="mb-2 px-3">
                タイプ音
              </v-col>
              <v-col cols="12" md="9" class="px-3">
                <v-select
                  v-model="correct"
                  :items="this.$CORRECT_SOUNDS"
                  item-text="label"
                  item-value="name"
                  solo
                  prepend-icon="mdi-play-circle"
                ></v-select>
              </v-col>
            </v-row>
            <v-row class="mb-7" align="center" no-gutters>
              <v-col cols="12" md="3" class="mb-2 px-3">
                ミス音
              </v-col>
              <v-col cols="12" md="9" class="px-3">
                <v-select
                  v-model="wrong"
                  :items="this.$WRONG_SOUNDS"
                  item-text="label"
                  item-value="name"
                  solo
                  prepend-icon="mdi-play-circle"
                ></v-select>
              </v-col>
            </v-row>
            <v-row align="center" no-gutters>
              <v-col cols="12" md="3" class="mb-5 px-3">
                音量
              </v-col>
              <v-col cols="12" md="9" class="px-3">
                <v-slider
                  v-model="volume"
                  min="0"
                  max="20"
                  prepend-icon="mdi-volume-high"
                ></v-slider>
              </v-col>
            </v-row>
          </v-container>
        </v-card-text>
      </v-card>
    </v-dialog>
  </div>
</template>

<script>
export default {
  name: "Play",
  components: {
    PlayComponent: () =>
      import(
        /* webpackChunkName: "PlayComponent" */ "../components/PlayComponent.vue"
      )
  },
  data() {
    return {
      genres: [],
      genreDialog: true,
      settingDialog: false,
      playMode: 'score',
      selectedGenre: "",
      disabled: true
    };
  },
  computed: {
    correct: {
      get() {
        return this.$store.getters['sound/getCorrect']
      },
      set(value) {
        this.$store.dispatch('sound/setCorrect', value)
      }
    },
    wrong: {
      get() {
        return this.$store.getters['sound/getWrong']
      },
      set(value) {
        this.$store.dispatch('sound/setWrong', value)
      }
    },
    volume: {
      get() {
        return this.$store.getters['sound/getVolume']
      },
      set(value) {
        this.$store.dispatch('sound/setVolume', value)
      }
    },
  },
  watch: {
    selectedGenre(v) {
      if (v) {
        this.disabled = false;
      } else {
        this.disabled = true;
      }
    }
  },
  created() {
    this.$axios.$get('/genres')
      .then((res) => {
        const genres = JSON.parse(res.data)
        genres.forEach((genre, i) => {
          this.genres.push(genre)
        })
      })
      .catch((err) => {
          console.log('エラーが発生しました', err)
      })
  },
  methods: {
    toggleDialog() {
      this.genreDialog = !this.genreDialog
      this.settingDialog = !this.settingDialog
    },
    submitGenre() {
      if (this.selectedGenre !== '') {
        this.$refs.PlayComponent.initMethods();
        this.genreDialog = false;
      }
    }
  }
};
</script>

<style lang="scss" scoped>
.btn-genre {
  width: 120px;
}
.w-100 {
  width: 100%;
}

.btn {
  width: 100%;
  padding: 12px;
  color: #fff;
  font-size: 20px;
  font-weight: bold;
  border-radius: 4px;
  transition: all 0.15s ease 0s;
  &::before {
    transition: none;
  }
  &.btn-engineer {
    background: #4caf50 !important;
    box-shadow: 0 10px 0 #2f6732;
    &.v-btn--active {
      box-shadow: 0 2px 0 #2f6732;
      transform: translateY(8px);
    }
  }
  &.btn-general {
    background: #a7a9a7 !important;
    box-shadow: 0 10px 0 #4f504f;
    &.v-btn--active {
      box-shadow: 0 2px 0 #4f504f;
      transform: translateY(8px);
    }
  }
}

.v-card__actions > .v-btn.v-btn {
  padding: 12px;
  height: unset !important;
}
</style>
