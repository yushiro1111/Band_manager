class Admin::BandsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin
  
    def destroy
      @band = Band.find(params[:id])
      @band.destroy
      redirect_to event_path(@band.event), notice: "バンドを削除しました。"
    end
  
    private
  
    def ensure_admin
      redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
    end
  end
  