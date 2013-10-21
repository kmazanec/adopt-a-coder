require 'spec_helper'

  describe User do

    context "Validations and Associations" do

      it "should have many media" do
        user = User.reflect_on_association(:media)
        user.macro.should == :has_many
      end

      it "should have many photos" do
        user = User.reflect_on_association(:photos)
        user.macro.should == :has_many
      end

      it "should have many videos" do
        user = User.reflect_on_association(:videos)
        user.macro.should == :has_many
      end

    end


  end

