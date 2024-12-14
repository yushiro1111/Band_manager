class Admin::DashboardController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin
  
    def index
      # ダッシュボードで必要なデータを取得
    end
  
    private
  
    def ensure_admin
      redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.role == 1
    end
  end
  