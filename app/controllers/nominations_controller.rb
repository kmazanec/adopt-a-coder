class NominationsController < ApplicationController

  def create
      puts "hello world"
    if current_user_donor && current_user.nomination_available?
      Nomination.create(donor_id: current_user.id, campaign_id: current_campaign, candidate_id: params[:candidate_id])
      flash[:success] = "Thank you for making a nomination! Stay tuned to see who wins!"
      redirect_to :root
    else
      flash[:error] = "Sorry you have already used your nomination for this campaign."
      redirect_to :back
    end

  end


  # def nomination_params
  #   params.require(:nomination).permit(:candidate)
  # end

end
