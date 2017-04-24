class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user and user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Inicio de sesión realizado correctamente"
      redirect_to user_path(user)
      
    else
      flash.now[:danger] = "Error en los datos de inicio de sesión. Por favor verificar"
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "Desconexión realizada satisfactoriamente"
    redirect_to root_path
  end
end