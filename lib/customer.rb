require_relative 'item_container'

class Customer

	include ItemContainer

	attr_reader :name, :phone_number

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number
	end

	def add_to_shopping_cart(quantity, item)
		quantity.times { add(item) }
	end

end