Rails.application.routes.draw do
  get 'homes/index'
  root to: 'homes#index'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users do
    collection do
      get 'profile'
    end
  end
end
