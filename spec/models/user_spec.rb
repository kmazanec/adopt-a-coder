require 'spec_helper'

  describe User do

    context "Validations and Associations" do

      it "should make a user" do
        FactoryGirl.create(:user).should be_valid
      end

    end
  end
