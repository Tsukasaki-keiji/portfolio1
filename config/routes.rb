Rails.application.routes.draw do
  
  root 'homes#top'
  get 'home/about' => 'homes#about'

  resources :genres, only: [:index, :create, :show, :edit, :update]
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :admins, controllers:{
    sessions:'admins/sessions',
    registrations:'admins/registrations',
    passwords:'admins/passwords'
  }
  
  namespace :admins do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
  end  
end
