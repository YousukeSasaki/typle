ActiveRecord::Base.connection.execute('TRUNCATE TABLE questions')

lists = [
  { preview: 'プログラミングスクール', kana: 'ぷろぐらみんぐすくーる', user_id: 1, genre_id: 2 },
  { preview: 'バージョン管理ツール', kana: 'ばーじょんかんりつーる', user_id: 1, genre_id: 2 },
  { preview: 'アジャイル開発', kana: 'あじゃいるかいはつ', user_id: 1, genre_id: 2 },
  { preview: 'タッチタイピング ', kana: 'たっちたいぴんぐ', user_id: 1, genre_id: 2 },
  { preview: 'キーボードのエンターキーが反応しない', kana: 'きーぼーどのえんたーきーがはんのうしない', user_id: 1, genre_id: 2 },
]

lists.each do |list|
  Question.create(
    preview: list[:preview],
    kana: list[:kana],
    user_id: list[:user_id],
    genre_id: list[:genre_id]
  )
end
