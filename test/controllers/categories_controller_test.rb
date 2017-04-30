require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  
  def setup
    # create en vez de new, ya que el create hace commit de una vez
    @categoria = Category.create( name: "sports")
  end
  
  test "debe llegar al index de categorias" do
    get :index  
    assert_response :success
  end
  
  test "debe llegar a la pagina new" do
    get :new 
    assert_response :success
  end
  
  test "debe llegar a la pagina show" do
    get(:show, {'id' => @categoria.id})  
    assert_response :success
  end
  
end
  
  
    