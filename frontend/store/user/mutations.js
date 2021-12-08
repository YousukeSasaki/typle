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
  SET_LEVEL(state, payload) {
    state.level = payload
  },
  SET_POINT(state, payload) {
    state.point = payload
  },
  SET_MAX_POINT(state, payload) {
    state.maxPoint = payload
  },
  SET_IS_LOGOUTING(state, payload) {
    state.isLogouting = payload
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
  RESET_LEVEL(state) {
    state.level = null
  },
  RESET_POINT(state) {
    state.point = null
  },
  RESET_MAX_POINT(state) {
    state.maxPoint = null
  },
  RESET_IS_LOGOUTING(state) {
    state.isLogouting = null
  }
}
