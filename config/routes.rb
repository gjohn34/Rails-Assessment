Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/testimonies'

  root to: 'profiles#index'

  resources :profiles do
    resources :photos
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
