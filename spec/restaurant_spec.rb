require 'restaurant'

describe Restaurant do
  let(:menu) { Menu.new }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:total) { double :total }

  it 'creates a Restaurant instance' do
    expect(subject).to be_instance_of(Restaurant)
  end

  describe '#see_menu' do
    it 'responds to the method' do
      expect(subject).to respond_to(:see_menu)
    end

    # it 'shows the customer the menu' do
    #   expect(subject.see_menu).to eq(menu.dishes)
    # end
  end

  describe '#add_to_order' do
    it 'responds to the method' do
      expect(subject).to respond_to(:add_to_order)
    end

    context '#add_to_order - adding dish from menu' do
      it 'adds a dish item to the basket' do
        allow(subject).to receive(:item_on_menu?) { true }
        expect { subject.add_to_order(dish, quantity) }.to change { subject.basket.length }.by(1)
      end
    end

    context '#add_to_order - adding dish not on menu' do
      it 'raises an error' do
        allow(subject).to receive(:item_on_menu?) { false }
        expect { subject.add_to_order(dish, quantity) }.to raise_error('This is not on the menu')
      end
    end
  end

  describe '#see_basket' do

    it 'responds to the method' do
      expect(subject).to respond_to(:see_basket)
    end

    context 'displaying the basket of items' do
      subject { Restaurant.new.add_to_order(dish, quantity, total) }

      # it 'displays the basket as a string' do
      #   allow(subject).to receive(:item_on_menu?) { true }
      #   expect(subject.see_basket).to eq("#{dish} x#{quantity} = £#{total}")
      # end
    end
  end
end
