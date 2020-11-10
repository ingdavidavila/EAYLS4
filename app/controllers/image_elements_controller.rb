class ImageElementsController < ApplicationController

  def create
  end

  def update
  end

  def image_element_params
    params.require(:image_element).permit(:image)
  end

end
