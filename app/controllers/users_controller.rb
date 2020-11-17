class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit,:update, :destroy]
  before_action :requerir_usuario, only: [:edit, :update]
  before_action :requerir_mismo_usuario, only: [:edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      cookies[:auth_token] = @user.id
      flash[:notice] = "Bienvenido A El Aguila y La Serpiente, #{@user.nombredeusuario} Tu Usuario A Sido Registrado"
      redirect_to articulos_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @articulo = Articulo.all.order ("created_at DESC")
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Usuario Editado Con Exito"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
      @user = User.all
  end

  def destroy
    @user.destroy
    cookie[:auth_token] = nil if @user == usuario_ensesion
    flash[:notice] = "Esta Cuenta Y Preferencias Asociadas Fueron Eliminadas"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:nombredeusuario, :email, :password, :avatar_elements, :admin, :auth_token)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def requerir_mismo_usuario
    if usuario_ensesion != @user && !usuario_ensesion.admin?
      flash[:alert] = "Solo Puedes Modificar Tu Propia Cuenta"
      redirect_to @user
    end
  end
end
