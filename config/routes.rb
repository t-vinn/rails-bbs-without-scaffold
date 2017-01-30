Rails.application.routes.draw do
  devise_for :users
  resources :my_threads do
    resources :comments
  end

  root 'my_threads#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
