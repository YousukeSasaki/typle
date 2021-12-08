export default function({ route, store, from }) {
  if (from.path == '/users/login_create' && route.path == '/') {
    // ログイン処理後の遷移先
    // ログインしましたフラッシュメッセージが
    // 既に含まれているのでリセットしない
    return
  } else if (from.path == '/login' && route.path == '/login') {
    let msgObj = {}
    if (store.getters['user/isLogouting'] == 'success') {
      // ログアウト成功後の遷移先
      // ログアウトしましたフラッシュメッセージを表示
      msgObj = {
        content: 'ログアウトしました',
        type: 'success'
      }
    } else if (store.getters['user/isLogouting'] == 'error') {
      // ログアウト失敗後の遷移先
      // ログアウトしましたフラッシュメッセージを表示
      msgObj = {
        content: 'ログインできませんでした。しばらく経ってからやり直していただくか、運営までお問い合わせください。',
        type: 'error'
      }
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
