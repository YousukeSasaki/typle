<template>
  <div class="text-center">
    <PlayComponent ref="PlayComponent" :genre="genre"></PlayComponent>
    <v-dialog v-model="dialog" width="500" persistent>
      <v-card>
        <v-card-title class="headline grey lighten-2 justify-center">
          ジャンル選択
        </v-card-title>

        <v-btn-toggle v-model="genre" class="d-block mt-6">
          <v-card-text class="pt-3">
            <v-container>
              <v-row align="center" no-gutters>
                <v-col cols="12" md="6" class="mb-6 px-3">
                  <v-btn class="btn btn-engineer" value="engineer">
                    <span>エンジニア</span>
                  </v-btn>
                </v-col>

                <v-col cols="12" md="6" class="mb-6 px-3">
                  <v-btn class="btn btn-general" value="general">
                    <span>一般</span>
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
      dialog: true,
      genre: "",
      disabled: true
    };
  },
  watch: {
    genre(v) {
      if (v) {
        this.disabled = false;
      } else {
        this.disabled = true;
      }
    }
  },
  methods: {
    submitGenre() {
      if (this.genre !== "") {
        this.$refs.PlayComponent.initMethods();
        this.dialog = false;
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
