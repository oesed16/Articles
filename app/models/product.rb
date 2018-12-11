class Product < ApplicationRecord
    has_and_belongs_to_many :categories
    validates :name, :price, :categories, presence: true
end