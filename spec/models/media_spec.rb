require 'spec_helper'

  describe Media do

    describe "Validations and Associations" do

      it "should belong to a user" do
        media = Media.reflect_on_association(:user)
        media.macro.should == :belongs_to
      end

      it "should have a link " do
        FactoryGirl.create(:media).should be_valid
      end

      it "should not be valid unless there is a link" do
        FactoryGirl.build(:media, url: nil).should_not be_valid
      end

       it  "should have a unique link" do
        media = FactoryGirl.create(:media)
        FactoryGirl.create(:media, url: "www.google.com")
        FactoryGirl.build(:media, url: "www.google.com").should_not be_valid
      end
    end
  end


