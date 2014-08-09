require 'order'

describe Order do

	let(:customer)         { double :customer, name: 'Marco'          }
	let(:order)            { Order.new(customer)                      }
	let(:burger)           { double :dish, name: 'Burger', price: 5.5 }
	let(:salad)            { double :dish, name: 'Salad', price: 4.5  }
	let(:items)            { [burger, burger, salad]                  }
	let(:takeaway) { double :restaurant }

	it 'is created with a customer' do
		expect(order.customer).to eq customer
	end

	it 'takes a list of items into the order' do
		order.add_list_of(items)
		expect(order.list_of_items).to eq [burger, burger, salad]
	end

	it 'has a list of the prices of the items in the list' do
		order.add_list_of(items)
		expect(order.list_of_prices).to eq [burger.price, burger.price, salad.price]
	end

	it 'knows the total price of the list of items' do
		order.add_list_of(items)
		expect(order.total_price).to eq 15.5
	end

	it 'saves the time' do
		expect(Time).to receive(:now)
		order.save_time
	end

	it 'can receive a list of items and place the order to a takeaway' do
		expect(takeaway).to receive(:confirm_order).with(order)
		expect(order).to receive(:save_time)
		order.receive(items, takeaway)
	end
  
end