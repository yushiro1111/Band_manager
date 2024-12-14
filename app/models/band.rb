class Band < ApplicationRecord
  belongs_to :event
  belongs_to :leader, class_name: "User"
  has_many :band_members, dependent: :destroy # BandMember との関連付け

  validates :name, presence: true
  validates :leader_id, presence: true

  def includes_participant?(participant)
    [vocal, guitar1, guitar2, bass, drum, keyboard].include?(participant)
  end

end


