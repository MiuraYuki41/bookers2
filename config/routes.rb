Rails.application.routes.draw do
 #get 'users/show'
 #get 'users/edit'
 #get 'books/new'
 #get 'books/index'
 #get 'books/show'
 #get 'books/edit'

 root to: "homes#top"
 devise_for :users

 get '/home/about' => 'homes#about'

 resources :books, only: [:new, :index, :show, :edit, :create, :update, :destroy]
 resources :users, only: [:new, :index, :show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
