class AvatarElementsController < ApplicationController

  def create
  end

  def update
  end

  def avatar_element_params
    params.require(:avatar_element).permit(:image)
  end

end
