Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "users/registrations"
}

  get "/users/sign_out", to: "sessions#destroy", as: :get_logout
  
  root "pages#home" # トップページを PagesController の home アクションに設定
  get "/past_performances", to: "pages#past_performances", as: :past_performances

  resources :bands, only: [:new, :create, :index]
end
