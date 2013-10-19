
class HomeController < ApplicationController

  def index
    @candidates = Candidate.all
  end

  def signup
    render :_signup
  end

end
