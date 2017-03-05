class ArticlesController < ApplicationController
  def new
    @articulo = Article.new
  end 
   
  def create
    # render plain: params[:article].inspect  #:article es el nombre del modelo creado, no el nombre de la variable de entorno
    @articulo = Article.new(article_params)
    @articulo.save
    redirect_to articles_show(@articulo)
    
  end 
  
  def article_params
    params.require(:article).permit(:title,:description)
  end

end