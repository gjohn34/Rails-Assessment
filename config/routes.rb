Rails.application.routes.draw do
  devise_for :users
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/testimonies'

  root to: 'profiles#index'

  resources :profiles do
    resources :messages
    get '/photos' => 'profiles#photos'#, as: :photos
    get '/interests' => 'profiles#interests'
    post '/interests' => 'profiles#update_interests'
  end
  post '/likes' => 'profiles#update_likes'
    # patch '/profiles/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
