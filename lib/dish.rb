class Dish

	attr_accessor :description, :ingredients
	attr_reader :name, :price

	def initialize(name, price)
		@name = name
		@price = price
	end

	def add_ingredients(*all_ingredients)
		@ingredients = all_ingredients
	end

end