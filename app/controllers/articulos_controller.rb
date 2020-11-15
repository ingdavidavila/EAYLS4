class ArticulosController < ApplicationController
    before_action :set_articulo, only: [:show, :edit, :update, :destroy]
    before_action :requerir_usuario, except: [:index, :show]
    before_action :requerir_mismo_usuario, only: [:edit, :update, :destroy]

    def show

    end

    def index
      if sesion_iniciada? && usuario_ensesion.admin?
        @articulo = Articulo.all.order("created_at DESC").paginate(page: params[:page], per_page: 10)
      else
        redirect_to root_path
      end
    end

    def new
      if sesion_iniciada? && usuario_ensesion.admin?
        @articulo = Articulo.new
      else
        redirect_to root_path
      end
    end

    def edit

    end

    def create
      @articulo = Articulo.new(params.require(:articulo).permit(:titulo, :cuerpo, :categoria, :image_elements))
      @articulo.user = usuario_ensesion
      if @articulo.save
        flash[:notice] = "Articulo fue creado con exito"
        redirect_to articulos_path(@articulo)
      else
        render 'new'
      end
    end

    def update
      if @articulo.update(params.require(:articulo).permit(:titulo, :cuerpo, :categoria, :image_elements))
        flash[:notice] = "Articulo Editado Con Exito"
        redirect_to @articulo
      else
        render 'edit'
      end
    end

    def destroy
      @articulo.destroy
      redirect_to articulos_path
    end

    private

    def set_articulo
      @articulo = Articulo.find(params[:id])
    end

    def requerir_mismo_usuario
      if usuario_ensesion != @articulo.user && !usuario_ensesion.admin?
        flash[:alert] = "Solo Administradores Pueden Modificar Articulos"
        redirect_to @articulo
      end
    end

end
