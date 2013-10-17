require 'spec_helper'

  describe Question do

    context "Validations and Associations" do

      it "should have many responses" do
        question = Question.reflect_on_association(:responses)
        question.macro.should == :has_many
      end

      it "should be valid with body text entered" do
        FactoryGirl.create(:question).should be_valid
      end

      it "should not be valid with out a body entered" do
        FactoryGirl.create(:question, body: nil).should_not be_valid
      end



    end
  end
