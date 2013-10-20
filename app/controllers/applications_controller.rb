class ApplicationsController < ApplicationController
####
####        REMEMBER THIS IS FOR CANDIDATE APPLICATIONS!
####

  def create
  end

  def update
    Application.save_application(update_params)
    if params[:save_and_exit]
      redirect_to edit_candidate_path(current_user)
    else
      redirect_to edit_candidate_application_path(current_user, current_application)
    end
  end

  def edit
    @responses = current_application.responses.all
  end

  def submit
    @application = current_user.application
    if @application.complete?
      begin
        @application.update_attribute(:complete, true)
        flash[:success] = "Your submission was successful! Please expect an introduction email regarding the selection process within the next 48 hours."
      rescue ActiveRecord::RecordNotFound
        flash[:notice] = "We were unable to submit that record. Please try again."
      ensure
        redirect_to edit_candidate_path(current_user)
      end
    else
      flash[:notice] = "Your submission was unsuccesful. Please ensure you have completed each question before submitting."
      redirect_to edit_candidate_path(current_user)
    end
  end

  private

  def update_params
    params.require(:application).permit(responses_attributes: [:id, :body])
  end

end
