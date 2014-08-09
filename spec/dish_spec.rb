require 'dish'

describe Dish do

	let(:burger) { Dish.new('Burger', 5.50) }

	it 'is created with a name and price' do
		expect(burger.name).to eq :burger
		expect(burger.price).to eq 5.50
	end

	it 'can contain a description' do
		burger.description = 'Fresh bun with angus beef meat'
		expect(burger.description).to eq 'Fresh bun with angus beef meat'
	end

	it 'can contain ingredients' do
		burger.add_ingredients('meat', 'bread', 'lettuce')
		expect(burger.ingredients).to eq ['meat', 'bread', 'lettuce']
	end
  
end