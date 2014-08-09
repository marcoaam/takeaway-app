module ItemContainer

	def list_of_items
		@list_of_items ||= []
	end

	def add_list_of(items)
		items.each { |item| add(item) }
	end

	def add(item)
		list_of_items << item
	end

end