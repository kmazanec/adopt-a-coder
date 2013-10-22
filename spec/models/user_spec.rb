require 'spec_helper'

  describe User do

    describe "Validations and Associations" do

      it "should have many media" do
        user = User.reflect_on_association(:media)
        user.macro.should == :has_many
      end

      it "should have many photos" do
        user = User.reflect_on_association(:images)
        user.macro.should == :has_many
      end

      it "should have many videos" do
        user = User.reflect_on_association(:videos)
        user.macro.should == :has_many
      end

      it "should have one profile picture" do
        user = User.reflect_on_association(:profile_image)
        user.macro.should == :has_one
      end

      it "should have one profile video" do
        user = User.reflect_on_association(:profile_video)
        user.macro.should == :has_one
      end
    end
  end




