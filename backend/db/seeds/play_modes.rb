ActiveRecord::Base.connection.execute('TRUNCATE TABLE play_modes')

lists = [
  { name: '段位認定モード', value: 'grade' },
  { name: 'スコアアタックモード', value: 'score' }
]

lists.each.with_index(1) do |list, i|
  PlayMode.create(
    name: list[:name],
    value: list[:value],
    sort_num: i
  )
end
