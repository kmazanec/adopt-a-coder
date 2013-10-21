
class HomeController < ApplicationController

  def index
    @candidates = Candidate.order("RANDOM()").limit(4)
  end

  def signup
    render :_signup
  end

end
