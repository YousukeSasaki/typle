export default {
  setAll({ commit }, payload) {
    commit('SET_ID', payload.id)
    commit('SET_NAME', payload.name)
    commit('SET_EMAIL', payload.email)
  },
  setIsLogouting({ commit }) {
    commit('SET_IS_LOGOUTING')
  },
  resetAll({ commit }) {
    commit('RESET_ID')
    commit('RESET_NAME')
    commit('RESET_EMAIL')
  },
  resetIsLogouting({ commit }) {
    commit('RESET_IS_LOGOUTING')
  }
}
