class Diet < ApplicationRecord
	belongs_to :coach

	has_many :user_eat_diets
	has_many :user, through: :user_eat_diets
	accepts_nested_attributes_for :user_eat_diets

	has_many :diet_composes
	has_many :foods, through: :diet_composes
	accepts_nested_attributes_for :diet_composes
end
