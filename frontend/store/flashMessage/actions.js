export default {
  setAll ({ commit }, payload) {
    commit('SET_CONTENT', payload.content)
    commit('SET_TYPE', payload.type)
  },
  resetAll ({ commit }) {
    commit('RESET_CONTENT')
    commit('RESET_TYPE')
  }
}
