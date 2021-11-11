export default {
  setCorrect ({ commit }, payload) {
    commit('setCorrect', payload)
  },
  setWrong ({ commit }, payload) {
    commit('setWrong', payload)
  },
  setVolume ({ commit }, payload) {
    commit('setVolume', payload)
  }
}
