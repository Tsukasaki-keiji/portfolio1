Rails.application.routes.draw do
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users

  resources :genres, only: [:index, :create, :show, :edit, :update]
  #resources :blogs do
  #  resources :bookmarks
  #end  
  resources :blogs do
   resources :bookmarks
   resources :comments, only: [:create, :destroy]
  end 
  resources :users, only: [:index, :show, :update, :edit, :new]
  
  resources :items, only: [:index, :show]
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
