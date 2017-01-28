Rails.application.routes.draw do
  devise_for :users
  resources :my_threads

  root 'my_threads#index'
  get 'my_threads/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
