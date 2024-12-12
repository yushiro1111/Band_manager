class BandsController < ApplicationController
    def new
      @band = Band.new
    end
  
    def create
      @band = Band.new(band_params)
      if @band.save
        redirect_to bands_path, notice: 'バンドが申請されました！'
      else
        render :new
      end
    end
  
    def index
        @bands = Band.all.includes(:leader) # N+1問題を回避するために関連をプリロード
    end
  
    private
  
    def band_params
      params.require(:band).permit(:name, :leader_id, :vocal, :guitar, :guitar2, :bass, :drum, :notes)
    end
  end
  