class BandsController < ApplicationController
  def new
    @event = Event.find_by(id: params[:event_id])
    if @event.nil?
      redirect_to events_path, alert: "イベントが見つかりませんでした。"
    else
      @band = Band.new
    end
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      # 許可する役割を定義
      allowed_roles = ["vocal", "guitar1", "guitar2", "bass", "drum", "keyboard"]

      # band_members パラメータを処理して各パートを保存
      params[:band_members]&.each do |role, user_id|
        next if user_id.blank? || !allowed_roles.include?(role) # 不明なカラムをスキップ
        @band.update(role => User.find(user_id).name)
      end

      redirect_to event_path(@band.event), notice: "バンドを申請しました。"
    else
      render :new
    end
  end

  private

  def band_params
    params.require(:band).permit(:name, :leader_id, :event_id, :notes)
  end
end