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
        user.macro.should == :belongs_to
      end

      it "should have one profile video" do
        user = User.reflect_on_association(:profile_video)
        user.macro.should == :belongs_to
      end

      describe "#send_password_reset" do
        before(:each) do
          @user = FactoryGirl.create(:user)
        end

        it "generates a unique password_reset_token each time" do
          @user.send_password_reset
          @last_token = @user.password_reset_token
          @user.send_password_reset
          @user.password_reset_token.should_not eq(@last_token)
        end

        it "saves the time the password reset was sent" do
          @user.send_password_reset
          @user.reload.password_reset_sent_at.should be_present
        end

        it "delivers email to the user" do
          @mail = @user.send_password_reset
          @mail.to.should eq [@user.email]
        end
      end

      describe "#send_password_set" do
        before(:each) do
          @user = FactoryGirl.create(:donor)
        end

        it "generates a unique password_reset_token each time" do
          @user.send_password_set
          @last_token = @user.password_reset_token
          @user.send_password_set
          @user.password_reset_token.should_not eq(@last_token)
        end

        it "saves the time the password reset was sent" do
          @user.send_password_set
          @user.reload.password_reset_sent_at.should be_present
        end

         it "delivers email to the donor" do
          @mail = @user.send_password_set
          @mail.to.should eq [@user.email]
        end

      end

    end
  end




