ActiveRecord::Base.connection.execute('TRUNCATE TABLE questions')

lists = [
  { preview: 'バグ', kana: 'ばぐ', kana_length: 2, user_id: 1, genre_id: 2 },
  { preview: 'ビルド', kana: 'びるど', kana_length: 3, user_id: 1, genre_id: 2 },
  { preview: 'コミット', kana: 'こみっと', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: '配列', kana: 'はいれつ', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: 'ブラウザ', kana: 'ぶらうざ', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: 'ヘッダー', kana: 'へっだー', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: '関数', kana: 'かんすう', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: '引数', kana: 'ひきすう', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: 'サーバー', kana: 'さーばー', kana_length: 4, user_id: 1, genre_id: 2 },
  { preview: 'プロパティ', kana: 'ぷろぱてぃ', kana_length: 5, user_id: 1, genre_id: 2 },
  { preview: '仕様書', kana: 'しようしょ', kana_length: 5, user_id: 1, genre_id: 2 },
  { preview: 'コンパイラ', kana: 'こんぱいら', kana_length: 5, user_id: 1, genre_id: 2 },
  { preview: '相対パス', kana: 'そうたいぱす', kana_length: 6, user_id: 1, genre_id: 2 },
  { preview: 'ネットワーク', kana: 'ねっとわーく', kana_length: 6, user_id: 1, genre_id: 2 },
  { preview: 'ループバック', kana: 'るーぷばっく', kana_length: 6, user_id: 1, genre_id: 2 },
  { preview: 'マネージャー', kana: 'まねーじゃー', kana_length: 6, user_id: 1, genre_id: 2 },
  { preview: 'フレームワーク', kana: 'ふれーむわーく', kana_length: 7, user_id: 1, genre_id: 2 },
  { preview: 'インターネット', kana: 'いんたーねっと', kana_length: 7, user_id: 1, genre_id: 2 },
  { preview: 'コメントアウト', kana: 'こめんとあうと', kana_length: 7, user_id: 1, genre_id: 2 },
  { preview: '非同期通信', kana: 'ひどうきつうしん', kana_length: 8, user_id: 1, genre_id: 2 },
  { preview: 'タッチタイピング', kana: 'たっちたいぴんぐ', kana_length: 8, user_id: 1, genre_id: 2 },
  { preview: '論理演算子', kana: 'ろんりえんざんし', kana_length: 8, user_id: 1, genre_id: 2 },
  { preview: 'アジャイル開発', kana: 'あじゃいるかいはつ', kana_length: 9, user_id: 1, genre_id: 2 },
  { preview: 'オブジェクト指向', kana: 'おぶじぇくとしこう', kana_length: 9, user_id: 1, genre_id: 2 },
  { preview: 'プログラミングスクール', kana: 'ぷろぐらみんぐすくーる', kana_length: 11, user_id: 1, genre_id: 2 },
  { preview: 'バージョン管理ツール', kana: 'ばーじょんかんりつーる', kana_length: 11, user_id: 1, genre_id: 2 },
  { preview: '動的型付け言語', kana: 'どうてきかたづけげんご', kana_length: 11, user_id: 1, genre_id: 2 },
  { preview: 'キーボードのエンターキーが反応しない', kana: 'きーぼーどのえんたーきーがはんのうしない', kana_length: 20, user_id: 1, genre_id: 2 },
  # { preview: '', kana: '', kana_length: , user_id: 1, genre_id: 2 },
]

lists.each do |list|
  Question.create(
    preview: list[:preview],
    kana: list[:kana],
    user_id: list[:user_id],
    genre_id: list[:genre_id]
  )
end
