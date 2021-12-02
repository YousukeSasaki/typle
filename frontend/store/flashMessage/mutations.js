export default {
  SET_CONTENT(state, payload) {
    state.content = payload
  },
  SET_TYPE(state, payload) {
    state.type = payload
  },
  RESET_CONTENT(state) {
    state.content = ''
  },
  RESET_TYPE(state) {
    state.type = ''
  }
}
