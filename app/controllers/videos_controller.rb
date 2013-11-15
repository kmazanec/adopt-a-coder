class VideosController < ApplicationController

  before_filter :require_candidate_login

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      flash[:success] = "You have successfully added a new video."
    else
      flash[:error] = "Invalid Parameters. Please try again."
    end
    redirect_to edit_candidate_path(current_user)
  end


  private

  def video_params
    params.require(:video).permit(:url)
  end



end