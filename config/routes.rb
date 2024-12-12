Rails.application.routes.draw do
  devise_for :users, controllers: {
  registrations: "users/registrations"
}

  get "/users/sign_out", to: "sessions#destroy", as: :get_logout

  root "pages#home" # トップページを PagesController の home アクションに設定
  resources :bands, only: [:new, :create, :index]
end
