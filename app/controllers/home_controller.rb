
class HomeController < ApplicationController

  def index
    cid = current_campaign.candidate.id
    @candidates = Candidate.where('id' != cid).order('random()').limit(4)
  end

  def signup
    render :_signup
  end

end
