class UsersController < ApplicationController
    
  # para que ejecute el procedimiento set_articulo en cada uno de los procedimientos indicados para no repetir codigo
  before_action :set_usuario, only: [:edit,:update]
  
  def new
    @usuario = User.new
  end
  
  def create
    @usuario = User.new(user_params)
    if @usuario.save
      flash[:success] = "Bienvenido a ALPHA-BLOG #{@usuario.username}"
      redirect_to articles_path
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
    @usuario = User.find(params[:id])
  end
  
  private
  
  def set_usuario
    @usuario = User.find(params[:id])
  end
  
  def user_params
    # son los parametros del modelo creado, actua como un record
    params.require(:user).permit(:username,:email,:password)
  end
  
end