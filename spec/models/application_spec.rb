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

    end
  end

