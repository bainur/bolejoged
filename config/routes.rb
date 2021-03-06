Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  namespace :admin do
    resources :users
    resources :sport_categories
    resources :events
  end
  root to: "pages#home"
end
