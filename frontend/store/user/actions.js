export default {
  setAll({ commit }, payload) {
    commit('SET_ID', payload.id)
    commit('SET_NAME', payload.name)
    commit('SET_EMAIL', payload.email)
  },
  resetAll({ commit }) {
    commit('RESET_ID')
    commit('RESET_NAME')
    commit('RESET_EMAIL')
  }
}
