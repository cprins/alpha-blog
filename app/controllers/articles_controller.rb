class ArticlesController < ApplicationController
  
  # para que ejecute el procedimiento set_articulo en cada uno de los procedimientos indicados para no repetir codigo
  # los before action se ejecutan en el orden que los colocas
  before_action :set_articulo, only: [:edit,:update,:show,:destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  
  def index
    # variable de entorno para listar todos los articulos
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @articulo = Article.new
  end 
   
  def create
    # render plain: params[:article].inspect  #:article es el nombre del modelo creado, no el nombre de la variable de entorno
    @articulo = Article.new(article_params)
    @articulo.user =  current_user #User.find(session[:user_id])
    if @articulo.save
      flash[:success] = "El articulo fue creado satisfactoriamente"
      redirect_to article_path(@articulo)
    else
      render 'new'
    end
    
  end 
  
  def show
  end
  
  def destroy
    @articulo.destroy
    flash[:danger] = "El articulo fue eliminado satisfactoriamente"
    redirect_to articles_path(@articulo)
  end
  
  def edit
  end
  
  def update
    if @articulo.update(article_params)
      flash[:success] = "El articulo fue modificado satisfactoriamente"
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
  
  def require_same_user
    if current_user != @articulo.user and !current_user.admin?
      flash[:danger] = "Solo puedes editar o borrar tus propios artículos"
      redirect_to root_path
    end
  end
end