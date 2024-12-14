class Event < ApplicationRecord
  has_many :bands, dependent: :destroy

  validates :name, :date, :location, :base_fee, presence: true
  validates :base_fee, numericality: { greater_than_or_equal_to: 0 }

  # 公開イベントを取得するスコープ
  scope :published, -> { where(published: true) }
end
