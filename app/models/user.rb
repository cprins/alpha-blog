class User < ActiveRecord::Base
  # dependent: :destroy  es para borrar en cascada todos los articulos cuando se elimine el usuario
  has_many    :articles, dependent: :destroy  
  before_save {self.email = email.downcase}
  validates   :username, presence: true, 
              uniqueness: {case_sensitive: false}, 
              length: {minimum: 3, maximum: 25}
  # validacion para el formato correcto de email
  VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates   :email, presence: true, length: { maximum: 50}, 
              uniqueness: {case_sensitive: false},
              format: { with: VALID_EMAIL_REGEX}
  has_secure_password
end