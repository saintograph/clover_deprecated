Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get 'portfolio', to: 'users#portfolio'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
