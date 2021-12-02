export default {
  SET_ID(state, payload) {
    state.id = payload
  },
  SET_NAME(state, payload) {
    state.name = payload
  },
  SET_EMAIL(state, payload) {
    state.email = payload
  },
  SET_IS_LOGOUTING(state) {
    state.isLogouting = true
  },
  RESET_ID(state) {
    state.id = null
  },
  RESET_NAME(state) {
    state.name = ''
  },
  RESET_EMAIL(state) {
    state.email = ''
  },
  RESET_IS_LOGOUTING(state) {
    state.isLogouting = false
  }
}
