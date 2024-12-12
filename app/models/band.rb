class Band < ApplicationRecord
    # アソシエーション: バンドはリーダー（User）に属する
  belongs_to :leader, class_name: 'User'
end
