Rails.application.routes.draw do
  root 'homes#index'

  devise_for :users, controllers: {
    passwords:  'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  get 'home/about' => 'homes#about', as: 'about_home'
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
end
