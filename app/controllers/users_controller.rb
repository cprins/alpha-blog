class UsersController < ApplicationController
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
  
  private
  
  def user_params
    # son los parametros del modelo creado, actua como un record
    params.require(:user).permit(:username,:email,:password)
  end
  
end