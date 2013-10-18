require 'spec_helper'

describe SessionsController do

  describe '#logout' do

    before do

      @candidate = FactoryGirl.create(:candidate)
    end

    it "clears the session at logout" do
      delete :logout

      expect(session[:id]).to eq nil
    end

    it "flashes a notice on logout" do
      delete :logout

      flash[:notice].should_not be_nil
    end

    it "redirects to root path" do
      delete :logout

      redirect_to root_path
    end



  end


end
