Rails.application.routes.draw do
  root to: 'questions#index'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :users,param: :nickname, except: %i[index]
  resources :hashtags, only: :show, param: :text

  resources :questions do
    member do
      put :hide
      patch :hide
    end
  end
end
