class UsersController < ApplicationController
    
  # para que ejecute el procedimiento set_articulo al inicio en cada uno de los procedimientos indicados para no repetir codigo
  before_action :set_usuario, only: [:edit,:update,:show]
  before_action :require_same_user, only: [:edit,:update]
  
  def index
    # variable de entorno para listar todos los usuarios
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  
  
  def new
    @usuario = User.new
  end
  
  def create
    @usuario = User.new(user_params)
    if @usuario.save
      session[:user_id] = @usuario.id
      flash[:success] = "Bienvenido a ALPHA-BLOG #{@usuario.username}"
      redirect_to user_path(@usuario)
    else
      render 'new'
    end
  end 
  
  def edit
  end
  
  def update
    if @usuario.update(user_params)
      flash[:success] = "Tu cuenta ha sido actualizada satisfactoriamente"
      redirect_to articles_path
    else
      render 'edit'
    end
  end
  
  def show
    @usuario_articulos = @usuario.articles.paginate(page: params[:page], per_page: 5)
  end
  
  private
  
  def set_usuario
    @usuario = User.find(params[:id])
  end
  
  def user_params
    # son los parametros del modelo creado, actua como un record
    params.require(:user).permit(:username,:email,:password)
  end
  
  def require_same_user
    if current_user != @usuario
      flash[:danger] = "Solo puedes editar tu propia cuenta"
      redirect_to root_path
    end
  end
  
  
end