class ApplicationController < ActionController::Base
    def after_sign_in_path_for(resource)
        if resource.admin?
            admin_dashboard_path # 管理者はダッシュボードにリダイレクト
        else
          root_path # 一般ユーザーはホームページにリダイレクト
        end
    end
    
      # Deviseログアウト後のリダイレクト先を設定
      def after_sign_out_path_for(resource_or_scope)
        root_path # ホームページにリダイレクト
      end
end
