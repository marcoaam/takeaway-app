class Restaurant

	attr_reader :name, :menu

	def initialize(name, menu)
		@name = name
		@menu = menu
	end

	def return_from_menu(item_name)
		menu.list_of_items.select { |item| item.name == standard_menu(item_name) }
	end

	def standard_menu(item_name)
		item_name.downcase.to_sym
	end

end