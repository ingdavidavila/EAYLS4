class PagesController < ApplicationController

  def home
    @articulo = Articulo.all.order("created_at DESC").paginate(page: params[:page], per_page: 5)
  end

  def acercade
  end

  def clasificados
      @articulo = Articulo.where(categoria: 'clasificados').order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def sociales
      @articulo = Articulo.where(categoria: 'sociales').order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def deportes
      @articulo = Articulo.where(categoria: 'deportes').order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def otaku
      @articulo = Articulo.where(categoria: 'otaku').order("created_at DESC").paginate(page: params[:page], per_page: 10)
  end

  def buscar
  end


end
