class SessionController < ApplicationController

  def nueva
  end

  def crear
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if params[:remember_me]
        cookies.permanent[:auth_token] = user.auth_token
      else
        cookies[:auth_token] = user.auth_token
      end
        flash[:notice] = "Ingresaste Exitosamente"
        redirect_to user
    else
        flash.now[:alert] = "Algo Salio Mal"
        render 'nueva'
    end
  end

  def destruir
    cookies.delete(:auth_token)
    flash[:notice] = "Cerraste Sesion"
    redirect_to root_path
  end


end
