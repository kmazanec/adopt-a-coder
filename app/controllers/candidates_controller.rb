class CandidatesController < ApplicationController
  def new
    @candidate = Candidate.new
  end

  def index
    if params[:search]
      @candidates = Candidate.search(params[:search]).order("Random()")
    else
      @candidates = Candidate.order("RANDOM()")
    end
  end

  def create

      @candidate = Candidate.new(candidate_params)
      if @candidate.save
        session[:id] = @candidate.id
        Application.create(candidate_id: @candidate.id)
        redirect_to candidate_path(@candidate)
      else

        flash[:notice] = "Invalid Parameters. Please try again."

        render :new
      end

  end

  def show

  end

private

def candidate_params
  params.require(:candidate).permit(:name, :email, :phone, :password, :password_confirmation, :address1, :address2, :city, :state, :zip)
end


end
