Rails.application.routes.draw do
  devise_for :users
  root to: 'profiles#index'
  #Static Pages
  get 'pages/index'
  get 'pages/about'
  get 'pages/contact'
  get 'pages/testimonies'


  resources :profiles do
    resources :messages
    resources :payments, only: [:new, :create]
    get '/photos' => 'profiles#photos'#, as: :photos
    get '/hookup' => 'profiles#hookup'
    get '/matches' => 'profiles#matches'
    get '/interests' => 'profiles#interests'
    post '/interests' => 'profiles#update_interests'
  end
  get '/success' => 'payments#success'
  get '/cancel' => 'payments#cancel'
  post '/likes' => 'profiles#update_likes'
    # patch '/profiles/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
