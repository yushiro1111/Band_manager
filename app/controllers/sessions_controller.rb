class SessionsController < ApplicationController
    def destroy
      # Devise のヘルパーを使用してログアウト処理
      sign_out(current_user)
      redirect_to root_path, notice: "ログアウトしました。"
    end
  end
  