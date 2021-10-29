ActiveRecord::Base.connection.execute('TRUNCATE TABLE genres')

lists = ['一般', 'エンジニア']

lists.each.with_index(1) do |name, i|
  Genre.create(
    name: name,
    sort_num: i
  )
end
