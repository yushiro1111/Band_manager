class Admin::EventsController < ApplicationController
    before_action :authenticate_user!
    before_action :ensure_admin
  
    def index
      @events = Event.all
    end
  
    def new
      @event = Event.new
    end
  
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to admin_events_path, notice: "イベントを作成しました。"
      else
        render :new
      end
    end
  
    def edit
      @event = Event.find(params[:id])
    end
  
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to admin_events_path, notice: "イベントを更新しました。"
      else
        render :edit
      end
    end
  
    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to admin_events_path, notice: "イベントを削除しました。"
    end

    def summary
      @event = Event.find(params[:id])
      @bands = @event.bands
  
      # すべての参加者を取得し、重複を排除
      @participants = @bands.flat_map do |band|
        [band.vocal, band.guitar1, band.guitar2, band.bass, band.drum, band.keyboard]
      end.compact.uniq
  
      # 参加者データを収集（出演回数と出演料を含む）
      @participant_data = @participants.map do |participant|
        appearances = @bands.select { |band| band.includes_participant?(participant) }.count
        fee = calculate_fee(@event.base_fee, appearances)
        { name: participant, appearances: appearances, fee: fee }
      end
  
      # 集計データ
      @participant_count = @participants.size
      @total_fee = @participant_data.sum { |data| data[:fee] }
    end
  
    private
  
    def calculate_total_fee(base_fee, participants)
      participants.sum do |participant|
        participant_bands = @bands.select { |band| band.includes_participant?(participant) }
        calculate_fee(base_fee, participant_bands.count)
      end
    end
  
    def calculate_fee(base_fee, appearances)
      return 0 if appearances.zero?
      base_fee + ((appearances - 1) * (base_fee / 2.0)).to_i
    end
  
    def ensure_admin
      redirect_to root_path, alert: "管理者権限が必要です。" unless current_user.admin?
    end
  
    def event_params
      params.require(:event).permit(:name, :date, :location, :base_fee, :published)
    end
  end