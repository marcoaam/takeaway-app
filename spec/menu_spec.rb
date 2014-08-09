require 'menu'

describe Menu do

	let(:menu)   { Menu.new       }
	let(:burger) { double :burger }

	it 'has a empty list of dishes when created' do
		expect(menu.list_of_dishes).to eq []
	end

	it 'can add a dish to the list of dishes' do
		menu.add(burger)
		expect(menu.list_of_dishes).to eq [burger]
	end
  
end