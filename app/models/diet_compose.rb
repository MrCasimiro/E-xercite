class DietCompose < ApplicationRecord
	belongs_to :diet
	belongs_to :food

	validates :food_id, :day, :hour, :quantity, presence: true
	validates :quantity, numericality: { greater_than: 0}
end
