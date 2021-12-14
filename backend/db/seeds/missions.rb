return if Rails.env.production? && MissionCategory.count.positive?

ActiveRecord::Base.connection.execute('TRUNCATE TABLE missions')

def add_comma(num)
  num.to_s.reverse.scan(/.{1,3}/).join(',').reverse
end

# TODO: DRYじゃないのでまとめたい
MissionCategory.roots.each do |root|
  case root.keyword
  when 'key_count'
    nums1 = [100, 300, 500]
    nums2 = (1..10).to_a.map { |n| add_comma(n * 1_000) } # 1_000, 2_000, ... , 10_000
    nums3 = (6..25).to_a.map { |n| add_comma(n * 2_000) } # 12_000, 14_000, ... , 50_000
    numbers = nums1 + nums2 + nums3

    root.children.each do |child|
      sort_num = Mission.where('keyword LIKE ?', "#{child.keyword}%")&.maximum(:sort_num) || 1
      label = child.keyword.sub(/key_count_/, '').upcase
      numbers.each do |num|
        name = "#{label}のキーを#{num}回タイプする"
        keyword = "#{child.keyword}_#{num}"
        mission = Mission.find_or_initialize_by(keyword: keyword)

        next if mission.created_at.present?

        mission.assign_attributes(
          name: name,
          category_id: child.id,
          sort_num: sort_num
        )
        mission.save

        sort_num += 1
      end
    end
  when 'play_count'
    num1 = [1, 3, 5]
    num2 = (2..10).to_a.map { |n| add_comma(n * 5) } # 10, 15, ... , 50
    num3 = (6..10).to_a.map { |n| add_comma(n * 10) } # 60, 70, ... , 100
    num4 = (6..50).to_a.map { |n| add_comma(n * 20) } # 120, 140, ... , 1_000
    numbers = num1 + num2 + num3 + num4

    root.children.each do |child|
      sort_num = Mission.where('keyword LIKE ?', "#{child.keyword}%")&.maximum(:sort_num) || 1
      label = child.name.sub(/のプレイ回数/, '')
      numbers.each do |num|
        name = "#{label}を#{num}回プレイする"
        keyword = "#{child.keyword}_#{num}"
        mission = Mission.find_or_initialize_by(keyword: keyword)

        next if mission.created_at.present?

        mission.assign_attributes(
          name: name,
          category_id: child.id,
          sort_num: sort_num
        )
        mission.save

        sort_num += 1
      end
    end
  when 'accuracy'
    num1 = [1, 3]
    num2 = (1..10).to_a.map { |n| add_comma(n * 5) } # 10, 15, ... , 50
    num3 = (6..10).to_a.map { |n| add_comma(n * 10) } # 60, 70, ... , 100 ¥100
    num4 = (11..20).to_a.map { |n| add_comma(n * 10) } # 110, 120, ... , 200 ¥99 ¥98
    num5 = (11..15).to_a.map { |n| add_comma(n * 20) } # 220, 240, ... , 300 ¥97 ¥96 ¥95
    num6 = (16..25).to_a.map { |n| add_comma(n * 20) } # 320, 340, ... , 500 ¥90
    num100 = num1 + num2 + num3
    num99 = num100 + num4
    num97 = num99 + num5
    num90 = num97 + num6

    root.children.each do |child|
      sort_num = Mission.where('keyword LIKE ?', "#{child.keyword}%")&.maximum(:sort_num) || 1
      label = child.name.sub(/でクリアした回数/, '')
      accuracy = child.keyword.match(/\d+/)[0].to_i
      numbers = case accuracy
                when 100
                  num100
                when 99, 98
                  num99
                when 97, 96, 95
                  num97
                when 90
                  num90
                end
      numbers.each do |num|
        name = "#{label}で#{num}回クリアする"
        keyword = "#{child.keyword}_#{num}"
        mission = Mission.find_or_initialize_by(keyword: keyword)

        next if mission.created_at.present?

        mission.assign_attributes(
          name: name,
          category_id: child.id,
          sort_num: sort_num
        )
        mission.save

        sort_num += 1
      end
    end
  end
end
