require 'customer'

describe Customer do

	let(:customer) { Customer.new('Marco', '+447785181622')    }
	let(:burger)   { double :dish, name: 'Burger', price: 5.5  }
	let(:salad)    { double :dish, name: 'salad', price: 5     }
	let(:takeaway) { double :restaurant, menu: [burger, salad] }
	let(:order)    { double :order                             }
  
  it 'is created with a name and mobile phone number' do
  	expect(customer.name).to eq 'Marco'
  	expect(customer.phone_number).to eq '+447785181622'
  end

  it 'can add a item to the shopping list of items' do
  	customer.add(burger)
  	expect(customer.list_of_items).to eq [burger]
  end

  it 'can add items to the list passing a quantity' do
  	expect(takeaway).to receive(:select_item).with('Burger').and_return(burger).at_least(:twice)
  	customer.add_to_cart_from(takeaway, 3, 'Burger')
  	expect(customer.list_of_items).to eq [burger, burger, burger]
  end

  it 'can submit an order' do
  	allow(takeaway).to receive(:select_item).with('Burger').and_return(burger).at_least(:twice)
  	allow(takeaway).to receive(:select_item).with('salad').and_return(salad).at_least(:twice)
  	customer.add_to_cart_from(takeaway, 1, 'Burger')
  	customer.add_to_cart_from(takeaway, 1, 'salad')

  	expect(order).to receive(:receive).with([burger, salad], takeaway)
  	expect(customer).to receive(:empty_shopping_cart)
  	customer.place(order, takeaway)
  end

  it 'can reset the shopping cart' do
  	customer.add(burger)
  	customer.add(salad)

  	customer.empty_shopping_cart

  	expect(customer.list_of_items).to eq []
  end

end