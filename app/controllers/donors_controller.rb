class DonorsController < ApplicationController

  def new
    @donor = Donor.new
  end

  def create

      @donor = Donor.create(donor_params)
      if @donor.id
        session[:id] = @donor.id
        redirect_to donor_path(@donor)
      else
        flash[:error] = "There was an error, please try again"
        render :new
      end

  end

  def show
    if logged_in? && current_user_donor
      @donor = current_user
      @donations = @donor.donations
      @nominations = @donor.nominations
    else
      redirect_to root_path
    end
  end

  private

  def donor_params
    params.require(:donor).permit(:email, :name, :password, :password_confirmation)
  end

end
