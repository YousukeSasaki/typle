return if Rails.env.production? && MissionCategory.count.positive?

ActiveRecord::Base.connection.execute('TRUNCATE TABLE mission_categories')

lists = [
  { name: 'タイプ数', keyword: 'key_count', child_categories:
    [
      { name: 'Aキーのタイプ数', keyword: 'key_count_a' },
      { name: 'Bキーのタイプ数', keyword: 'key_count_b' },
      { name: 'Cキーのタイプ数', keyword: 'key_count_c' },
      { name: 'Dキーのタイプ数', keyword: 'key_count_d' },
      { name: 'Eキーのタイプ数', keyword: 'key_count_e' },
      { name: 'Fキーのタイプ数', keyword: 'key_count_f' },
      { name: 'Gキーのタイプ数', keyword: 'key_count_g' },
      { name: 'Hキーのタイプ数', keyword: 'key_count_h' },
      { name: 'Iキーのタイプ数', keyword: 'key_count_i' },
      { name: 'Jキーのタイプ数', keyword: 'key_count_j' },
      { name: 'Kキーのタイプ数', keyword: 'key_count_k' },
      { name: 'Lキーのタイプ数', keyword: 'key_count_l' },
      { name: 'Mキーのタイプ数', keyword: 'key_count_m' },
      { name: 'Nキーのタイプ数', keyword: 'key_count_n' },
      { name: 'Oキーのタイプ数', keyword: 'key_count_o' },
      { name: 'Pキーのタイプ数', keyword: 'key_count_p' },
      { name: 'Qキーのタイプ数', keyword: 'key_count_q' },
      { name: 'Rキーのタイプ数', keyword: 'key_count_r' },
      { name: 'Sキーのタイプ数', keyword: 'key_count_s' },
      { name: 'Tキーのタイプ数', keyword: 'key_count_t' },
      { name: 'Uキーのタイプ数', keyword: 'key_count_u' },
      { name: 'Vキーのタイプ数', keyword: 'key_count_v' },
      { name: 'Wキーのタイプ数', keyword: 'key_count_w' },
      { name: 'Xキーのタイプ数', keyword: 'key_count_x' },
      { name: 'Yキーのタイプ数', keyword: 'key_count_y' },
      { name: 'Zキーのタイプ数', keyword: 'key_count_z' }
    ] },
  { name: 'プレイ回数', keyword: 'play_count', child_categories:
    [
      { name: '段位認定モードのプレイ回数', keyword: 'play_count_grade_mode' },
      { name: 'スコアアタックモードのプレイ回数', keyword: 'play_count_score_mode' }
    ] },
  { name: '精度', keyword: 'accuracy', child_categories:
    [
      { name: '精度90%以上でクリアした回数', keyword: 'accuracy_90' },
      { name: '精度95%以上でクリアした回数', keyword: 'accuracy_95' },
      { name: '精度96%以上でクリアした回数', keyword: 'accuracy_96' },
      { name: '精度97%以上でクリアした回数', keyword: 'accuracy_97' },
      { name: '精度98%以上でクリアした回数', keyword: 'accuracy_98' },
      { name: '精度99%以上でクリアした回数', keyword: 'accuracy_99' },
      { name: '精度100%でクリアした回数', keyword: 'accuracy_100' }
    ] }
]

lists.each.with_index(1) do |list, i|
  category = MissionCategory.find_or_initialize_by(
    keyword: list[:keyword],
    ancestry: nil
  )

  if category.created_at.blank?
    category.sort_num = i
    category.name = list[:name]
    category.save
  end

  child_num = category.child_ids.max || 1

  list[:child_categories].each do |child|
    child_category = MissionCategory.find_or_initialize_by(keyword: child[:keyword])

    next if child_category.created_at.present?

    child_category.sort_num = child_num
    child_category.name = child[:name]
    child_category.ancestry = category.id
    child_category.save

    child_num += 1
  end
end
