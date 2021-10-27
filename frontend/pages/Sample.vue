<template>
  <div class="text-center">
    <button class="play" @click="setupSample">play</button>
    <!-- <audio src="../assets/sounds/cursor8.mp3"></audio> -->
  </div>
</template>

<script>
export default {
  name: 'Sample',
  data() {
    return {
      sampleSource: null,
      ctx: new (window.AudioContext || window.webkitAudioContext)()
    }
  },
  methods: {
    async setupSample() {
      const response = await fetch('/src/components/HelloWorld.vue')
      console.log(response)
      const arrayBuffer = await response.arrayBuffer()
      console.log(arrayBuffer)
      // // Web Audio APIで使える形式に変換
      const audioBuffer = await this.ctx.decodeAudioData(arrayBuffer)
      console.log(audioBuffer)
      return audioBuffer
    },
    playSample(ctx, audioBuffer) {
      this.sampleSource = ctx.createBufferSource()
      // 変換されたバッファーを音源として設定
      this.sampleSource.buffer = audioBuffer
      // 出力につなげる
      this.sampleSource.connect(ctx.destination)
      this.sampleSource.start()
    },
    async playSound() {
      const sample = await this.setupSample()
      this.playSample(this.ctx, sample)
    }
  }
}
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
  &.btn-enginner {
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
