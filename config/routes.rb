AdoptACoder::Application.routes.draw do

  root "home#index"

  resources "donors"
  resources "candidates" do
    resources "applications"
  end

  get '/logout' => 'sessions#logout'

  post 'candidate/application/submit' => 'applications#submit'

end
