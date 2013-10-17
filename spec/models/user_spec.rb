require 'spec_helper'

  describe User do

    context "Validations and Associations" do

      it "should have many media types" do
        user = User.reflect_on_association(:media)
        user.macro.should == :has_many
      end

      it "should not be valid with no fields entered" do
        FactoryGirl.create(:user).should_not be_valid
      end

      it "should NOT be valid if password and passord confirmation dont match" do
        FactoryGirl.build(:user, password: "not password").should_not be_valid
      end

      it "should be valid with a vaild email and password" do
        FactoryGirl.create(:user).should be_valid
      end

      it "should have a password" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
      end

      it "should not create a user without proper email syntax" do
        FactoryGirl.build(:user, email: 'bob.com').should_not be_valid
      end

      it  "should not let you create a user without a unique email" do
        user = FactoryGirl.create(:user)
        FactoryGirl.create(:user, email: "scott@gmail.com")
        FactoryGirl.build(:user, email: "scott@gmail.com").should_not be_valid
      end



    end
  end
