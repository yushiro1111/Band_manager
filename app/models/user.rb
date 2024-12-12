class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    enum role: { member: 0, admin: 1 }
  end
  