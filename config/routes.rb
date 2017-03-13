Rails.application.routes.draw do

  apipie
  resources :fotds
  root to: 'landings#index'

  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users
  resources :tag
  resources :landings
  resources :anon_facts
  resources :notifications

  resource :status

  namespace :api do
      namespace :v1 do
   	    resources :facts
   	    resources :devices
      end
  end

  namespace :admin do
    resources :facts
    resources :users
    resources :homes
    resources :devices
    resources :newsletters
    resources :notifications
  end

  resources :facts do
     post :thumbs_up
     post :thumbs_down
    collection do
       post :import
    end
  end


 devise_scope :user do
  	get '/login' => 'devise/sessions#new'
  	get '/logout' => 'devise/sessions#destroy'
  end

  authenticate :user, lambda { |u| u.admin? } do
   require 'sidekiq/web'
   mount Blazer::Engine,  at: "admins/blazer"
   mount Sidekiq::Web,    at: 'admins/sidekiq'
   mount PgHero::Engine,  at: "admins/pghero"
  end
end
