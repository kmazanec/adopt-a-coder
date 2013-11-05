class ImagesController < ApplicationController

  def create
    @image = current_user.images.build(image_params)
    if @image.save
      flash[:success] = "You have successfully added a new image."
    else
      flash[:error] = "Your image was not successfully uploaded. Please try again."
    end
    redirect_to edit_candidate_path(current_user)
  end




  private

  def image_params
    params.require(:image).permit(:url)
  end
end