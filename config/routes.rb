Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/testimonies'

  root to: 'profiles#index'

  resources :profiles do
    get '/photos' => 'profiles#photos'#, as: :photos
    get '/interests' => 'profiles#interests'
    post '/interests' => 'profiles#update_interests'
    # patch '/profiles/:id'

  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
