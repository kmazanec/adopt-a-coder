class ApplicationsController < ApplicationController
####
####        REMEMBER THIS IS FOR CANDIDATE APPLICATIONS!
####

  def create
  end

  def update
    Application.save_application(update_params)
    if params[:save_and_continue]
      redirect_to :back
    elsif params[:next]
      redirect_to :back
    else params[:back]
      redirect_to :back
    end
  end

  def edit
    @responses = current_application.responses.all
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

  private

  def update_params
    params.require(:application).permit(responses_attributes: [:id, :body])
  end

end
