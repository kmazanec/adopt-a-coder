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

  post 'candidate/application/submit' => 'applications#submit'

end
