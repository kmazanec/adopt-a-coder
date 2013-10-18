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
        flash[:notice] = "There was an error, please try again"
        render :new
      end

  end

  def show
    if logged_in? && current_user_donor
      @donor = current_user
      @donations = Donation.includes(:candidate).find_by(donor: @donor)
      @nominations = Nomination.includes(:candidate).find_by(donor: @donor)
    else
      redirect_to index_path
    end
  end

  private

  def donor_params
    params.require(:donor).permit(:email, :name, :password, :password_confirmation)
  end

end
