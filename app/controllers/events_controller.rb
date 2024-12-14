class EventsController < ApplicationController
  def index
    @events = Event.published # 公開中のイベントのみ取得
  end

  def show
    @event = Event.find(params[:id])
    @bands = @event.bands || [] # nilの場合に空の配列を代入
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: "イベントが見つかりません。"
  end

  def select_band
    @event = Event.published.find(params[:id])
  end

  def bands
    @event = Event.find(params[:id])
    @bands = @event.bands # イベントに関連付いたバンドを取得
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: "イベントが見つかりません。"
  end

  
end
