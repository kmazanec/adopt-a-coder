class ApplicationsController < ApplicationController
####
####        REMEMBER THIS IS FOR CANDIDATE APPLICATIONS!
####

  def create
  end

  def update
  end

  def edit
  end

  def submit
    begin
      @application = current_user.application
      @application.update_attribute(:complete, true)
    rescue ActiveRecord::RecordNotFound
      flash[:notice] = "We were unable to submit that record. Please try again."
    ensure
      redirect_to candidate_path(current_user)
    end
  end
end
