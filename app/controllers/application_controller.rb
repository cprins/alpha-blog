class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #para usar estos metodos en los views
  helper_method :current_user , :logged_in?
  
  def current_user
    # @current_user ||= retorna el current_user si el current_user ya existe
    # esto para que cada vez que sea invocado no realice la consulta en la BD si ya 
    # se realizo anteriormente
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    # el !! convierte la respuesta en un booleano ( si no consigue nada devuelve false, si consigue el usuario devuelve true)
    !!current_user
  end
  
  def require_user
    # significa if not logged in
    if !logged_in?
      flash[:danger] = "Debes estar conectado para realizar esta acción"
      redirect_to root_path
    end
  end
end
