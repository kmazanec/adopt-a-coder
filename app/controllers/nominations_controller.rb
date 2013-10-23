class NominationsController < ApplicationController

  def create
    if current_user_donor && current_user.nomination_available?
      nomination = Nomination.create(donor_id: current_user.id, campaign_id: current_campaign.id, candidate_id: params[:id])
      if nomination.valid?
        render json: { message:"completed" }
      else
        render json: { message:"error"}
      end
    else
      render json: { message:"unable"}
    end

  end


  # def nomination_params
  #   params.require(:nomination).permit(:candidate)
  # end

end
