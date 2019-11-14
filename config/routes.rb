Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/show'
  get 'doses/new'
  get 'doses/create'
  get 'doses/edit'
  get 'doses/update'
  get 'doses/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, except: [:new, :create]
  root to: 'cocktails#index'
end
