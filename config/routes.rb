Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items do
    resources :orders, only: [:index]
      collection do
        get 'done', to: 'orders#done'
        post 'pay', to: 'orders#pay'
      end
    end
  end


