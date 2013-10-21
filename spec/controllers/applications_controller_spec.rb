require 'spec_helper'

describe ApplicationsController do


  describe "#submit" do
    before(:each) do
      @application = FactoryGirl.create(:application)
      @question = FactoryGirl.create(:question)
      @application.questions = [@question]
      @myresponse = FactoryGirl.create(:response)
      @candidate = FactoryGirl.create(:candidate)
      @candidate.application = @application
      @app = @candidate.application
      @app.responses = [@myresponse]

      controller.stub(:current_user).and_return(@candidate)
      controller.stub(:current_application).and_return(@app)

    end

    it "should change the status of a users application to complete and have success flash notice" do
      post 'submit'


      @candidate.reload.application.complete.should eq true
      flash[:success].should eq "Your submission was successful! Please expect an introduction email regarding the selection process within the next 48 hours."
      response.should redirect_to profile_candidate_path(@candidate)
    end

    it "should not let application be submited if it isnt completely full" do
      @application.stub(:complete?).and_return(false)
      post 'submit'


      @candidate.reload.application.complete.should eq false
      flash[:error].should eq "Your submission was unsuccesful. Please ensure you have completed each question before submitting."
      response.should redirect_to profile_candidate_path(@candidate)
    end

    it "should not let application be submited if it isnt completely full" do
      @application.stub(:complete).and_return(true)
      post 'submit'


      @candidate.reload.application.complete.should eq false
      flash[:error].should eq "You have already submitted the application."
      response.should redirect_to profile_candidate_path(@candidate)
    end

  end

  describe "#edit" do

    it 'should render the edit page' do
      @candidate = FactoryGirl.create(:candidate)
      @app = @candidate.application
      controller.stub(:current_application).and_return(@candidate.application)

      get :edit, candidate_id: @candidate.id, id: @app.id

      response.should render_template(:edit)
    end

  end

  describe "#update" do

    it 'should update the application' do

      @myresponse = Response.create!(body: "this is a response")

      @application = FactoryGirl.create(:application)
      @candidate = FactoryGirl.create(:candidate)
      @candidate.application = @application
      @app = @candidate.application

      controller.stub(:current_user).and_return(@candidate)
      controller.stub(:current_application).and_return(@app)

      patch :update, candidate_id: @candidate.id, id: @application.id, application: {"responses_attributes"=>{"0"=>{"body"=>"Hello, Worldaslkdjfjkldsjhadslf", "id"=> @myresponse.id}}}

      @myresponse.reload.body.should eq "Hello, Worldaslkdjfjkldsjhadslf"
      response.should redirect_to(edit_candidate_application_path(@candidate, @app))
    end
  end
end








