class ArticlesController < ApplicationController
  
  # para que ejecute el procedimiento set_articulo en cada uno de los procedimientos indicados para no repetir codigo
  before_action :set_articulo, only: [:edit,:update,:show,:destroy]
  
  def index
    # variable de entorno para listar todos los articulos
    @articulos = Article.all
  end
  
  def new
    @articulo = Article.new
  end 
   
  def create
    # render plain: params[:article].inspect  #:article es el nombre del modelo creado, no el nombre de la variable de entorno
    @articulo = Article.new(article_params)
    if @articulo.save
      flash[:notice] = "El articulo fue creado satisfactoriamente"
      redirect_to article_path(@articulo)
    else
      render 'new'
    end
    
  end 
  
  def show
  end
  
  def destroy
    @articulo.destroy
    flash[:notice] = "El articulo fue eliminado satisfactoriamente"
    redirect_to articles_path(@articulo)
  end
  
  def edit
  end
  
  def update
    if @articulo.update(article_params)
      flash[:notice] = "El articulo fue modificado satisfactoriamente"
      redirect_to article_path(@articulo)
    else
      render 'edit'
    end
  end
  
 
  private
  
  def set_articulo
    @articulo = Article.find(params[:id])
  end
  
  def article_params
    # son los parametros del modelo creado, actua como un record
    params.require(:article).permit(:title,:description)
  end
  

end