AdoptACoder::Application.routes.draw do

  root "home#index"

  resources "charges"
  resources "donors"

  resources "candidates" do
    resources "applications"
  end

  get '/logout' => 'sessions#logout'
  post '/login' => 'sessions#login'
  get '/signup' => 'home#signup'

  post '/candidate/application/submit' => 'applications#submit'

  post '/nominations' => 'nominations#create'

  get '/candidates/:id/profile' => 'candidates#profile', :as => 'profile_candidates'



end
