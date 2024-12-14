class BandMember < ApplicationRecord
  belongs_to :band
  belongs_to :user

  validates :role, presence: true
end
