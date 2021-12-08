class Exp < ApplicationRecord
  belongs_to :user

  def gain_exp
    # 経験値を１獲得
    self.point += 1
    # 最大値に到達したらレベルアップ
    level_up if point == max_point

    save!
  end

  def level_up
    self.point = 0 # 経験値リセット
    self.level += 1 # レベルアップ

    i = 1
    loop do
      if triangular_num(i - 1) < level && level <= triangular_num(i)
        self.max_point = i
        break
      end
      i += 1
    end
  end

  #    num = 0,  1,  2,  3,   4,   5, ...
  # return = 0, 10, 30, 60, 100, 150, ...
  def triangular_num(num)
    5 * num * (num + 1)
  end
end
