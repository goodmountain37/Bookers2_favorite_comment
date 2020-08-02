Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'home/about' => 'homes#about', as: 'about_home'
  resources :users, only: [:index, :show]
  resources :books, only: [:new, :create, :index, :show]
end
