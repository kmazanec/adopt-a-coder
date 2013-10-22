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
    if @application.complete? && @application.candidate.profile_completed? && !@application.complete
      @application.update_attribute(:complete, true)
      flash[:success] = "Your submission was successful! Please expect an introduction email regarding the selection process within the next 48 hours."
      ApplicationsMailer.applications_mailer(@application).deliver
      render :json => { :message => true, :notice => "completed" }
    else
      if @application.complete
        flash[:error]= "You have already submitted an application."
        render :json => { :message => false, :notice => "unable" }
      else
        flash[:error] = "Your submission was unsuccesful. Please ensure you have completed your profile and answered each question before submitting."
        render :json => { :message => false, :notice => "error" }
      end
    end
  end

  private

  def update_params
    params.require(:application).permit(responses_attributes: [:id, :body])
  end

end

# respond_to do |format|
#       format.json { }
#       format.html { render :html => "HTML" }
#     end

# render { render :html => "HTML"}

