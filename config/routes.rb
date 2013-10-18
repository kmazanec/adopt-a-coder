AdoptACoder::Application.routes.draw do

  root "home#index"

  resources "charges"
  resources "donors"
  resources "candidates" do
    resources "applications"
  end

  get '/logout' => 'sessions#logout'

end
