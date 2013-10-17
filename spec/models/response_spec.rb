require 'spec_helper'

  describe Response do

    context "Validations and Associations" do

      it "should belong to an application" do
        response = Response.reflect_on_association(:application)
        response.macro.should == :belongs_to
      end

      it "should have one candidate" do
        response = Response.reflect_on_association(:candidate)
        response.macro.should == :has_one
      end

      it "should belong to question" do
        response = Response.reflect_on_association(:question)
        response.macro.should == :belongs_to
      end

      it "should be valid with body text entered" do
        FactoryGirl.create(:response).should be_valid
      end

      it "should not be valid with out a body entered" do
        FactoryGirl.build(:response, body: nil).should_not be_valid
      end



    end
  end
