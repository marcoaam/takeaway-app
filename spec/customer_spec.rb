require 'customer'

describe Customer do

	let(:customer) { Customer.new('Marco', '+447785181622')    }
	let(:burger)   { double :dish, name: 'Burger', price: 5.5  }
	let(:salad)    { double :dish, name: 'salad', price: 5     }
	let(:takeaway) { double :restaurant, menu: [burger, salad] }
  
  it 'is created with a name and mobile phone number' do
  	expect(customer.name).to eq 'Marco'
  	expect(customer.phone_number).to eq '+447785181622'
  end

  it 'can add a item to the shopping list of items' do
  	customer.add(burger)
  	expect(customer.list_of_items).to eq [burger]
  end

  it 'can add items to the list passing a quantity' do
  	customer.add_to_shopping_cart(3, burger)
  	expect(customer.list_of_items).to eq [burger, burger, burger]
  end

end