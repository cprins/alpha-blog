class Category < ActiveRecord::Base
   # para asociacion de muchos a muchos
    has_many :article_categories
    has_many :articles, through: :article_categories
  validates :name, presence: true, length: {minimum: 3, maximum: 25}
  validates_uniqueness_of  :name
end