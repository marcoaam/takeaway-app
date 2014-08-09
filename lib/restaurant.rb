require_relative 'item_container'
require_relative 'text_message'

class Restaurant

	include TextMessaging

	include ItemContainer

	attr_reader :name, :menu

	def initialize(name, menu)
		@name = name
		@menu = menu
	end

	def select_item(name)
		item = menu.list_of_items.select { |item| item.name == name.downcase.to_sym }.first
		raise 'Sorry item not available' if item == nil
		item
	end

	def confirm(order)
		add(order)
		send_sms(order.customer.phone_number, message(order.time))
	end

	def message(time)
		"Thank you! Your order was placed and will be delivered before #{calculate_delivery(time)}"
	end

	def calculate_delivery(time)
		time_plus1 = time + 3600
		time_plus1.to_s.split(" ").[]1
	end

end