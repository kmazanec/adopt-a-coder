class NominationsController < ApplicationController

  def create
    if current_user_donor && current_user.nomination_available?
      nomination = Nomination.create(donor_id: current_user.id, campaign_id: current_campaign.id, candidate_id: params[:id])
      if nomination.valid?
        render json: { message:true, notice:"completed" }
      else
        render json: { message:false, notice:"error"}
      end
    else
      render json: { message:false, notice:"unable"}
    end

  end


  # def nomination_params
  #   params.require(:nomination).permit(:candidate)
  # end

end
