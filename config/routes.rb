Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :admin do
    resources :users
    resources :sport_categories
  end
  root to: "pages#home"
end
