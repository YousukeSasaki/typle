return if Rails.env.production? && Genre.count.positive?

lists = [
  { name: '一般', value: 'general' },
  { name: 'エンジニア', value: 'engineer' }
]
sort_num = Genre.count.zero? ? 1 : Genre.maximum(:sort_num)

lists.each do |list|
  genre = Genre.find_or_initialize_by(
    name: list[:name],
    value: list[:value]
  )

  next if genre.created_at.present?

  genre.sort_num = sort_num
  genre.save

  sort_num += 1
end
