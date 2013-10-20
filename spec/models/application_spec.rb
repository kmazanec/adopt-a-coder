require 'spec_helper'

  describe Application do

    context "Validations and Associations" do

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
          application = FactoryGirl.create(:application)
          response = FactoryGirl.build(:response, body: "hello")
          application.responses = [response]
          answer = application.complete?

          answer.should eq false
        end

        it "should return true if the length of a response is less then 10 characters" do
          application = FactoryGirl.create(:application)
          response = FactoryGirl.build(:response)
          application.responses = [response]
          answer = application.complete?

          answer.should eq true
        end

      end

    end
  end

