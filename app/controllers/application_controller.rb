class ApplicationController < ActionController::Base
    class ApplicationController < ActionController::Base
        def after_sign_in_path_for(resource)
            if resource.admin? # 管理者の場合
              admin_dashboard_path
            else
              root_path # 一般ユーザーの場合
            end
        end
    end
    
      # Deviseログアウト後のリダイレクト先を設定
      def after_sign_out_path_for(resource_or_scope)
        root_path # ホームページにリダイレクト
      end
end
