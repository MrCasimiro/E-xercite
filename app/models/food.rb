class Food < ApplicationRecord
	has_many :diet_composes
	has_many :diets, through: :diet_composes 
	
	validates :name_food, presence: true, length: {maximum: 50}
end
