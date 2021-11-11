export default {
  setCorrect (state, payload) {
    state.correct = payload
  },
  setWrong (state, payload) {
    state.wrong = payload
  },
  setVolume (state, payload) {
    state.volume = payload
  }
}
