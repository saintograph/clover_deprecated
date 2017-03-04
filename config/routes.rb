Rails.application.routes.draw do
  resources :user_stocks
  devise_for :users
  resources :user_stocks, except: [:show, :edit, :update]
  root 'welcome#index'
  get 'portfolio', to: 'users#portfolio'
  get 'search_stocks', to: 'stocks#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
