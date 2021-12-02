export default function({ route, store, from }) {
  if (from.path == '/users/login_create' && route.path == '/') {
    // ログイン処理後の遷移先
    // ログインしましたフラッシュメッセージが
    // 既に含まれているのでリセットしない
    return
  } else if (from.path == '/login' && route.path == '/login' && store.getters['user/isLogouting']) {
    // ログアウト処理後の遷移先
    // ログアウトしましたフラッシュメッセージを表示
    const msgObj = {
      content: 'ログアウトしました',
      type: 'success'
    }
    store.dispatch('flashMessage/setAll', msgObj)
    // ログアウト中ステータスのリセット
    store.dispatch('user/resetIsLogouting')
  } else {
    // ページ移動のタイミングで
    // フラッシュメッセージをリセットする
    store.dispatch('flashMessage/resetAll')
  }
}
