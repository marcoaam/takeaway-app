class Menu

	attr_reader :list_of_dishes

	def initialize
		@list_of_dishes = []
	end

	def add(dish)
		@list_of_dishes << dish
	end
end