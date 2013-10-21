class ApplicationsController < ApplicationController
####
####        REMEMBER THIS IS FOR CANDIDATE APPLICATIONS!
####

  def create
  end

  def update
    Application.save_application(update_params)
    if params[:save_and_exit]
      redirect_to profile_candidate_path(current_user)
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
      @application.update_attribute(:complete, true)
      @application.save
        flash[:success] = "Your submission was successful! Please expect an introduction email regarding the selection process within the next 48 hours."
        ApplicationsMailer.applications_mailer(@application).deliver
        redirect_to profile_candidate_path(current_user)
    else
      flash[:error] = "Your submission was unsuccesful. Please ensure you have completed each question before submitting."
      redirect_to profile_candidate_path(current_user)
    end
  end

  private

  def update_params
    params.require(:application).permit(responses_attributes: [:id, :body])
  end

end



