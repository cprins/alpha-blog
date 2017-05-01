class CategoriesController < ApplicationController
  
  before_action :require_admin, except: [:index, :show]
  
  def index
    # para la paginacion
    @categories = Category.paginate(page: params[:page], per_page: 5)
  end

  def new
    @categoria = Category.new
  end
  
  def create
    @categoria = Category.new(category_params)
    if @categoria.save
      flash[:success] = "La categoría fue creada satisfactoriamente"
      redirect_to categories_path
    else
      render 'new'
    end
  end 
  
  def show
  
  end
  
  private
  
  def category_params
    params.require(:category).permit(:name)
  end
  
  def require_admin
    if !logged_in? || (logged_in? and !current_user.admin?)
      flash[:danger] = "Solo usuarios aministradores pueden realizar esta accion"
      redirect_to categories_path
    end
  end
  
end