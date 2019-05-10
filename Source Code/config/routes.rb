Rails.application.routes.draw do

  post 'modal/login' => 'login'
  get 'modal/signup' => 'modal'
  get 'modal/forgot' => 'forgot'


  devise_for :users
  root to: 'profiles#index'

  #Static Pages
  # scope shallow_prefix: "pages" do
    get 'pages/about' => 'pages#about', as: :about
    get 'pages/contact' => 'pages#contact', as: :contact
    get 'pages/testimonies' => 'pages#testimonies', as: :testimonies
  # end


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

  get '/messages' => 'messages#index'

  get "search/index"
    # patch '/profiles/:id'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
