return if Rails.env.production? && MissionCategory.count.positive?

ActiveRecord::Base.connection.execute('TRUNCATE TABLE mission_categories')

lists = [
  { name: 'タイプ数', key: 'key_count', child_categories:
    [
      { name: 'Aキーのタイプ数', key: 'key_count_a' },
      { name: 'Bキーのタイプ数', key: 'key_count_b' },
      { name: 'Cキーのタイプ数', key: 'key_count_c' },
      { name: 'Dキーのタイプ数', key: 'key_count_d' },
      { name: 'Eキーのタイプ数', key: 'key_count_e' },
      { name: 'Fキーのタイプ数', key: 'key_count_f' },
      { name: 'Gキーのタイプ数', key: 'key_count_g' },
      { name: 'Hキーのタイプ数', key: 'key_count_h' },
      { name: 'Iキーのタイプ数', key: 'key_count_i' },
      { name: 'Jキーのタイプ数', key: 'key_count_j' },
      { name: 'Kキーのタイプ数', key: 'key_count_k' },
      { name: 'Lキーのタイプ数', key: 'key_count_l' },
      { name: 'Mキーのタイプ数', key: 'key_count_m' },
      { name: 'Nキーのタイプ数', key: 'key_count_n' },
      { name: 'Oキーのタイプ数', key: 'key_count_o' },
      { name: 'Pキーのタイプ数', key: 'key_count_p' },
      { name: 'Qキーのタイプ数', key: 'key_count_q' },
      { name: 'Rキーのタイプ数', key: 'key_count_r' },
      { name: 'Sキーのタイプ数', key: 'key_count_s' },
      { name: 'Tキーのタイプ数', key: 'key_count_t' },
      { name: 'Uキーのタイプ数', key: 'key_count_u' },
      { name: 'Vキーのタイプ数', key: 'key_count_v' },
      { name: 'Wキーのタイプ数', key: 'key_count_w' },
      { name: 'Xキーのタイプ数', key: 'key_count_x' },
      { name: 'Yキーのタイプ数', key: 'key_count_y' },
      { name: 'Zキーのタイプ数', key: 'key_count_z' }
    ] },
  { name: 'プレイ回数', key: 'play_count', child_categories:
    [
      { name: '段位認定モードのプレイ回数', key: 'play_count_grade_mode' },
      { name: 'スコアアタックモードのプレイ回数', key: 'play_count_score_mode' }
    ] },
  { name: '精度', key: 'accuracy', child_categories:
    [
      { name: '精度90%以上でクリア', key: 'accuracy_90' },
      { name: '精度95%以上でクリア', key: 'accuracy_95' },
      { name: '精度96%以上でクリア', key: 'accuracy_96' },
      { name: '精度97%以上でクリア', key: 'accuracy_97' },
      { name: '精度98%以上でクリア', key: 'accuracy_98' },
      { name: '精度99%以上でクリア', key: 'accuracy_99' },
      { name: '精度100%でクリア', key: 'accuracy_100' }
    ] }
]

lists.each.with_index(1) do |list, i|
  category = MissionCategory.find_or_initialize_by(
    key: list[:key],
    parent_id: nil
  )

  if category.created_at.blank?
    category.sort_num = i
    category.name = list[:name]
    category.save
  end

  min = (i * 1000) + 1
  max = (i + 1) * 1000
  child_num = MissionCategory.where(id: min..max)&.maximum(:id) || min

  list[:child_categories].each do |child|
    child_category = MissionCategory.find_or_initialize_by(key: child[:key])

    next if child_category.created_at.present?

    child_category.sort_num = child_num
    child_category.name = child[:name]
    child_category.parent_id = category.id
    child_category.save

    child_num += 1
  end
end
