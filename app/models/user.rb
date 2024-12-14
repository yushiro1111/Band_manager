class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    
    enum role: { user: 0, admin: 1 }
  
    # 手動で admin? メソッドを定義
    def admin?
      role == "admin"
    end
  end
  