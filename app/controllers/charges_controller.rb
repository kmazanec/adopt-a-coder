class ChargesController < ApplicationController
  def new
  end

  def show
  end

  def create

    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://manage.stripe.com/account
    Stripe.api_key = "sk_test_UiyLySwAvxuicW8WYNbBS8vr"

    # Get the credit card details submitted by the form
    token = params[:stripeToken]
    
    @amount = params[:amount]
    @paid = (@amount.to_i * 100).to_s
   

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        :amount => @paid, # amount in cents, again
        :currency => "usd",
        :card => token,
        :description => "payinguser@example.com"
      )
      @charge_id = charge.id #This will store the token that is returned on a successful process of the car
      @donor = Donor.find_by(email: params[:email])
      
        if @donor == nil
          temp_password = password_generator
          @donor = Donor.create(name: params[:name], email: params[:email], password: temp_password, password_confirmation: temp_password)
          session[:id] = @donor.id
          DonorMailer.donation_mailer(@donor).deliver
          @donation = Donation.create(token: @charge_id, amount: @amount, donor: @donor, campaign: current_campaign)
          render :_donation_confirmation
        else
          flash[:success] = "Your donation was successful!  Thank you!  Please log in to make a nomination."
          @donation = Donation.create(token: @charge_id, amount: @amount, donor: @donor, campaign: current_campaign)
          render :_donation_confirmation
        end

    rescue Stripe::CardError => e
      flash[:error] = "Your card could not be verified, please try a different form of payment."
      redirect_to root_path
      
    end
  end
end