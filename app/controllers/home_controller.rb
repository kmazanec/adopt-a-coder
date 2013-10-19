
class HomeController < ApplicationController

  def index
    @candidates = Candidate.all
  end

end
