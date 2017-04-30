require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
   
  test "obtener la forma new category y create category"  do 
    # que el path este creado
    get new_category_path
    #  que el template este creado
    assert_template 'categories/new'
    # la tabla de categoria debe tener un registro al hacer la sentencia
    assert_difference 'Category.count' , 1 do 
      # va al post de categories_path, y le manda come parametro el nombre de la categoria
      post_via_redirect categories_path, category: { name: "sports"}
    end
    # va al template index de categories
    assert_template 'categories/index'
    #busca la palabra "sports" en el body  del index (para cerificar si se creo la categoria)
    assert_match "sports",response.body
  end
  
  # test para verificar que existaq el fallo cuando se intenta registrar una categoria sin nombre
  test "La presentación de una categoría no válida resulta en un fallo"  do 
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do 
    post categories_path, category: { name: " "}
    end
    # regresa al new ya que no se registró la categoria
    assert_template 'categories/new'
    #busca si se muesta esta etiqueta, que es la etiqueta usada en los errores
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
    
end