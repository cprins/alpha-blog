require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    # create en vez de new, ya que el create hace commit de una vez
    @categoria = Category.create( name: "sports")
    @usuario = User.create(username: "john", email: "john@example.com", password: "password", 
                           admin: true)
  end
  
  test "debe llegar al index de categorias" do
    get :index  
    assert_response :success
  end
  
  test "debe llegar a la pagina new" do
    session[:user_id] = @usuario.id
    get :new 
    assert_response :success
  end
  
  test "debe llegar a la pagina show" do
    get(:show, {'id' => @categoria.id})  
    assert_response :success
  end
  
  test "should redirect create when admin not logged in" do
    # no debe haber cambios en la cantidad de categorias al realizar la accion dentro del DO
    assert_no_difference 'Category.count' do
      post :create, category: { name: "sports" }
    end
    # redirecciona al listado de categorias
    assert_redirected_to categories_path
  end
  
end
  
  
    