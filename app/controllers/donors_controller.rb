class DonorsController < ApplicationController

  def new
    @donor = Donor.new
  end

  def create
    begin
      @donor = Donor.create(donor_params)
      if @donor.id
        session[:id] = @donor.id
        redirect_to donor_path(@donor)
      else
        flash[:notice] = "There was an error, please try again"
        render :new
      end
    rescue ApplicationController::ParameterMissing
      flash[:notice] = "Required Parameters Missing"
      render :new
    end
  end

  def show

  end

  private

  def donor_params
    params.require(:donor).permit(:email, :name, :password, :password_confirmation)
  end

end