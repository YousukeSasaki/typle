export default {
  setAll({ commit }, payload) {
    commit('SET_ID', payload.id)
    commit('SET_NAME', payload.name)
    commit('SET_EMAIL', payload.email)
    commit('SET_LEVEL', payload.level)
    commit('SET_POINT', payload.point)
    commit('SET_MAX_POINT', payload.maxPoint)
  },
  setExp({ commit }, payload) {
    commit('SET_LEVEL', payload.level)
    commit('SET_POINT', payload.point)
    commit('SET_MAX_POINT', payload.maxPoint)
  },
  setIsLogouting({ commit }, payload) {
    commit('SET_IS_LOGOUTING', payload)
  },
  resetAll({ commit }) {
    commit('RESET_ID')
    commit('RESET_NAME')
    commit('RESET_EMAIL')
    commit('RESET_LEVEL')
    commit('RESET_POINT')
    commit('RESET_MAX_POINT')
  },
  resetIsLogouting({ commit }) {
    commit('RESET_IS_LOGOUTING')
  }
}
