require 'test_helper'

class CategoryTest  < ActiveSupport:: TestCase
    
  # el setupo lo ejecuta al principio de todas las pruebas
  def setup
    @categoria = Category.new(name: "sports")
  end
  
  test "categoria debe ser valido" do 
   assert @categoria.valid?
  end
  
  test "nombre debe estar presente" do
    @categoria.name = " "
    assert_not @categoria.valid?
  end
  
  test "nombre debe ser unico" do
   @categoria.save
   categoria2 = Category.new(name: "sports")
   assert_not categoria2.valid?
  end
  
  test "nombre no debe ser muy largo" do
    @categoria.name = "a" * 26
    assert_not @categoria.valid?
  end
  
  test "nombre no debe ser muy corto" do
    @categoria.name = "aa"
    assert_not @categoria.valid?
  end
  
end