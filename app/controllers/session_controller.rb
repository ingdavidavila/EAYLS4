class SessionController < ApplicationController

  def nueva
  end

  def crear
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Ingresaste Exitosamente"
      redirect_to user
    else
      flash.now[:alert] = "Algo Salio Mal"
      render 'nueva'
    end
  end

  def destruir
    session[:user_id] = nil
    flash[:notice] = "Cerraste Sesion"
    redirect_to root_path
  end


end
