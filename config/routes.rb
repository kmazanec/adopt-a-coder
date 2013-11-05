AdoptACoder::Application.routes.draw do


  # get "password_resets/new"
  root "home#index"

  resources "charges"
  resources "donors"
  # resources :password_resets

  get '/password_resets' => 'password_resets#new'
  post '/password_resets' => 'password_resets#create'
  get 'password_resets/:token' => 'password_resets#edit', as: 'password_resets_verify_token'
  post 'password_resets/:token' => 'password_resets#update', as: 'password_resets_verified'


  resources "candidates" do
    resources "applications"
    resources "images"
    resources "videos"
  end

  get '/logout' => 'sessions#logout'
  post '/login' => 'sessions#login'
  get '/signup' => 'home#signup'

  post '/candidate/application/submit' => 'applications#submit'

  post 'candidates/:id/nomination' => 'nominations#create', :as => 'nominate_candidate'

  get '/candidates/:id/profile' => 'candidates#profile', :as => 'profile_candidate'


  mount JasmineRails::Engine => "/specs" if defined?(JasmineRails)

  get '/faq' => 'home#faq'


end
