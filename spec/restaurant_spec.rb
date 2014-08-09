require 'restaurant'

describe Restaurant do

	let(:burger)   { double :dish, name: :burger, price: 5.5         }
	let(:salad)    { double :dish, name: :salad, price: 5            }
	let(:menu)     { double :menu, list_of_items: [burger, salad]    }
	let(:customer) { double :customer, phone_number: '+447785181622' }
	let(:takeaway) { Restaurant.new("Marco's Burgers", menu)         }
	let(:order)    { double :order, customer: customer, time: 10     }

	it 'is created with a name and a menu' do
		expect(takeaway.name).to eq "Marco's Burgers"
		expect(takeaway.menu).to eq menu
	end

	it 'returns the item if it is available on the menu' do
		expect(menu).to receive(:list_of_items)
		expect(takeaway.select_item('Burger')).to eq burger
	end

	it 'raises a error if the item is not available on the menu' do
		expect(menu).to receive(:list_of_items)
		expect{takeaway.select_item('sandwich')}.to raise_error(RuntimeError)
	end

	it 'can take the order and send a message' do
		expect(takeaway).to receive(:add).with(order)
		expect(order).to receive(:customer)
		expect(takeaway).to receive(:message).with(order.time)
		expect(takeaway).to receive(:message).with(order.time)
		expect(takeaway).to receive(:send_sms).with(order.customer.phone_number, takeaway.message(order.time))

		takeaway.confirm(order)
	end

end