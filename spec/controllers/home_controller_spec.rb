require 'spec_helper'

describe HomeController do

   describe "#signup" do

    it 'should render the signup partial' do
      get :signup

      expect(response).to render_template(:partial => '_signup')
    end
  end

end

