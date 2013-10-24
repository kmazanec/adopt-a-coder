require 'spec_helper'

describe HomeController do

   describe "#signup" do

    it 'should render the signup partial' do
      get :signup

      expect(response).to render_template(:partial => '_signup')
    end
   end

    describe "#index" do

      it 'should show all the candidates except for the current candidate' do
        @campaign = FactoryGirl.create(:campaign)
        @candidate = FactoryGirl.create(:candidate)
        controller.stub(:current_campaign).and_return(@campaign)
        @campaign.candidate = @candidate
        @candidate_2 = FactoryGirl.build(:candidate, email: "testingemail@gmail.com")
        get :index


        response.should render_template(:index)
        @candidate_2.id.should_not eq @campaign.candidate.id
      end
    end

end


