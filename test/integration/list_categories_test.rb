require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
   
  def setup
    @categoria = Category.create(name: "sports") 
    @categoria2 = Category.create(name: "programming") 
  end
  
  test "debe mostrar listado de categorias" do
    get categories_path
    assert_template 'categories/index'
    # verifica que haya un link que vaya a la pantalla de categoria y tenga el nombre de la categoria creada anteriormente
    assert_select "a[href=?]", category_path(@categoria), text: @categoria.name
    assert_select "a[href=?]", category_path(@categoria2), text: @categoria2.name
    
  end
    
end