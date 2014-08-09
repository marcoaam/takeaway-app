require 'restaurant'

describe Restaurant do

	let(:burger)   { double :dish, name: :burger, price: 5.5      }
	let(:salad)    { double :dish, name: :salad, price: 5         }
	let(:menu)     { double :menu, list_of_items: [burger, salad] }
	let(:customer) { double :customer                             }
	let(:takeaway) { Restaurant.new("Marco's Burgers", menu)      }

	it 'is created with a name and a menu' do
		expect(takeaway.name).to eq "Marco's Burgers"
		expect(takeaway.menu).to eq menu
	end

	it 'returns the item if it is available on the menu' do
		expect(menu).to receive(:list_of_items)
		expect(takeaway.return_from_menu('Burger')).to eq [burger]
	end

end