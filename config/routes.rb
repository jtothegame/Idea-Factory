Rails.application.routes.draw do

  resources :ideas do
    resources :reviews, only: [:create, :destroy]
  end

  resources :users, only: [:new, :create]

  resources :sessions, only: [:new, :create, :edit] do
    delete :destroy, on: :collection
  end

  root 'ideas#index'
end
