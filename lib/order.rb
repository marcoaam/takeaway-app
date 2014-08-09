require_relative 'item_container'

class Order

	include ItemContainer

	attr_reader :customer

	def initialize(customer)
		@customer = customer
		@list_of_items = []
	end

	def total_price
		list_of_prices.inject(:+)
	end

	def list_of_prices
		@list_of_items.map { |item| item.price }
	end

end