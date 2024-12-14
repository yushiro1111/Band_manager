Rails.application.routes.draw do

  namespace :admin do
    resources :events, except: [:show]
    get 'dashboard', to: 'dashboard#index', as: :dashboard
    get '/events/:id/delete', to: 'events#destroy', as: :delete_event #イベント削除機能
    get '/bands/:id/delete', to: 'bands#destroy', as: :delete_band

    resources :events, only: [] do
      member do
        get :summary # イベント単位の集計ページ
      end
    end
  end

  
  devise_for :users, controllers: {
  registrations: "users/registrations"
}

  get "/users/sign_out", to: "sessions#destroy", as: :get_logout
  
  root "pages#home" # トップページを PagesController の home アクションに設定
  get "/past_performances", to: "pages#past_performances", as: :past_performances

  resources :events, only: [:index, :show] do
    member do
      get :select_band # イベント選択ページ
    end
  end
  
  resources :bands, only: [:new, :create]

  

end

