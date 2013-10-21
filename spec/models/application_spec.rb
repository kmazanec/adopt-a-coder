require 'spec_helper'

  describe Application do

    describe "Validations and Associations" do

      it "should belong to a candidate" do
        application = Application.reflect_on_association(:candidate)
        application.macro.should == :belongs_to
      end

      it "should have many responses" do
        application = Application.reflect_on_association(:responses)
        application.macro.should == :has_many
      end

      it "should have many questions" do
        application = Application.reflect_on_association(:questions)
        application.macro.should == :has_many
      end

      describe "#complete?" do
        it "should return false if the length of a response is less then 10 characters" do
          @application = FactoryGirl.create(:application)
          @question = FactoryGirl.build(:question, body: "whos is steve kerr")
          @application.questions = [@question]
          @myresponse = FactoryGirl.build(:response, body: "hello")
          @application.responses = [@myresponse]


          @application.complete?.should eq false
        end

        it "should return true if the length of a response is less then 10 characters" do
          @application = FactoryGirl.create(:application)
          @question = FactoryGirl.build(:question, body: "what is derrick roses number?")
          @application.questions = [@question]
          @myresponse = FactoryGirl.build(:response)
          @application.responses = [@myresponse]


          @application.complete?.should eq true
        end

      end

      describe "#completed_responses" do

        it "should return the amount of completed responses" do
          @application = FactoryGirl.create(:application)
          @question = FactoryGirl.build(:question, body: "who is carlos boozer?")
          @application.questions = [@question]
          @myresponse = FactoryGirl.build(:response)
          @application.responses = [@myresponse]

          @application.completed_responses.should eq 1
        end

      end

      describe "#response_percent_complete" do

        it "should return the percent amount of completed responses" do
          @application = FactoryGirl.create(:application)
          @question = FactoryGirl.build(:question, body: "who is nick swisher?")
          @application.questions = [@question]
          @myresponse = FactoryGirl.build(:response)
          @application.responses = [@myresponse]

          @application.response_percent_complete.should eq 100
        end
      end
    end
  end



