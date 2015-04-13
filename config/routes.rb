Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  match '/article/upload' => 'article_images#upload', via: [:post]
  match '/search' => 'home#search', via: [:get]

  get ':partial/:nav_token', to: 'home#show_article'
  get ':partial', to: 'home#show'

  get '/*path', to: 'home#index'

  resources :articles
  resources :navigations
  resources :enquiries
end
