Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'cocktails/search', to: 'cocktails#search', as: :search
  resources :cocktails do
    resources :doses, only: [:create]
    resources :reviews, only: [:create]
  end
  resources :doses, except: [ :create, :show]
  resources :reviews, except: [ :create, :show]
  root to: 'cocktails#index'
end
