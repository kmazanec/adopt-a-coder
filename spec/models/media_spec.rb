require 'spec_helper'

  describe Media do

    context "Validations and Associations" do

      it "should belong to a user" do
        media = Media.reflect_on_association(:user)
        media.macro.should == :belongs_to
      end

      it "should have a link to a video of themselves" do
        FactoryGirl.create(:media).should be_valid
      end

      it "should not be valid unless they have a link to a video or picture of themselves" do
        FactoryGirl.create(:media, url: nil).should_not be_valid
      end




    end
  end

