require 'menu'

describe Menu do

	let(:menu)   { Menu.new       }
	let(:burger) { double :burger }

	it 'has a empty list of dishes when created' do
		expect(menu.list_of_items).to eq []
	end

	it 'can add a dish to the list of dishes' do
		menu.add(burger)
		expect(menu.list_of_items).to eq [burger]
	end

	it 'can add a list to the list of dishes' do
		menu.add_list_of([burger, burger])
		expect(menu.list_of_items).to eq [burger, burger]
	end
  
end