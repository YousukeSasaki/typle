ActiveRecord::Base.connection.execute('TRUNCATE TABLE genres')

lists = [
  { name: '一般', value: 'general' },
  { name: 'エンジニア', value: 'engineer' }
]

lists.each.with_index(1) do |list, i|
  Genre.create(
    name: list[:name],
    value: list[:value],
    sort_num: i
  )
end
