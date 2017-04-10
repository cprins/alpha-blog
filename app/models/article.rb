class Article < ActiveRecord::Base
    belongs_to :user
    # validaciones de campo
    # presence: valida que el campo no sea nulo
    validates :title, presence: true,  length: {minimum: 3, maximum: 50}
    validates :description, presence: true , length: {minimum: 10, maximum: 300}
    validates :user_id, presence: true
end