class DonorsController < ApplicationController

  before_filter :require_donor_login, except: [:new, :create]

  def new
    @donor = Donor.new
  end

  def create

      @donor = Donor.create(donor_params)
      respond_to do |format|
      if @donor.id
        session[:id] = @donor.id
        DonorMailer.welcome_email(@donor).deliver
        format.html { redirect_to(@donor) }

        # redirect_to donor_path(@donor)
      else
        flash[:error] = "There was an error, please try again"
        format.html { render action: 'new' }
        # render :new
      end
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
