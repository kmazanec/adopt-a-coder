class CandidatesController < ApplicationController

  def new
    @candidate = Candidate.new
  end

  def index

  end

  def create
    begin
      @candidate = Candidate.new(candidate_params)
      if @candidate.save
        session[:id] = @candidate.id
        redirect_to candidate_path(@candidate)
      else
        # flash[:notice] what are the errors?
        render :new
      end
    rescue ApplicationController::ParameterMissing
      flash[:notice] = "Invalid Parameters. Please try again."
      redirect_to new_candidate_path
    end
  end

  def show

  end

private

def candidate_params
  params.require(:candidate).permit(:name, :email, :phone, :password, :password_confirmation, :address1, :address2, :city, :state, :zip)
end


end
