require_relative 'item_container'

class Customer

	include ItemContainer

	attr_reader :name, :phone_number

	def initialize(name, phone_number)
		@name = name
		@phone_number = phone_number
	end

	def add_to_cart_from(takeaway, quantity, item_name)
		quantity.times { add(takeaway.select_item(item_name)) }
	end

	def place(order, takeaway)
		order.receive(list_of_items, takeaway)
		empty_shopping_cart
	end

	def empty_shopping_cart
		@list_of_items = []
	end

end