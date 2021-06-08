Rails.application.routes.draw do
  use_doorkeeper do
    skip_controllers :authorizations, :applications, :authorized_applications
  end

  resources :users do
    resources :posts
    resources :comments
  end

  resources :posts do
    resources :comments
  end

  resources :users, only: %i[create]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# 'webapp', 'WK1d7LG9wj4TVL8b1t8nW868EgZkTdGq9MukAk_LuqQ', 'j3gXJ52MXzVCXk7dd7aylx9tUuz2kdS8DPhsDV1XSqg'
