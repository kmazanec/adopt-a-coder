AdoptACoder::Application.routes.draw do

  root "home#index"

  resources "donors"
  resources "candidate" do
    resources "application"
  end

  get '/logout' => 'sessions#logout'

end
