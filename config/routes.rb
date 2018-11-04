Rails.application.routes.draw do
  resources :orders
  get 'bsd-banner', to: 'bannerpartner#index'
  get '/privacy', to: 'infopersonal#index'
  get '/loyalty', to: 'loyalty#index'
  resources :banners
  resources :userroles
  resources :storages
  resources :posts
  resources :titles
  resources :branches
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :cities

  get 'persons/profile'
  get 'home/index'
  get '/about', to: 'about#index'
  get '/order', to: 'order#index'
  get '/branch_list', to: 'branches#list'

  root to: 'home#index'
end
