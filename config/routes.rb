AdoptACoder::Application.routes.draw do

  root "home#index"

  resources "donor"
  resources "candidate" do
    resources "application"
  end


end
