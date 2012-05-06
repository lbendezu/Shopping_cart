class Product < ActiveRecord::Base
  attr_accessible :category, :description, :name, :price, :quantity
end
