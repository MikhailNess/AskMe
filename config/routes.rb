Rails.application.routes.draw do
  root to: 'questions#index'
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create]
  resources :users, except: %i[index]
  resources :questions do
    member do
      put :hide
      patch :hide
    end
  end
end
