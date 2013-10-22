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
      ApplicationsMailer.applications_mailer(@application).deliver
      render json: { message:true, notice:"completed" }
    else
      if @application.complete
        render json: { message:false, notice:"unable" }
      else
        render json: { message:false, notice:"error" }
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

