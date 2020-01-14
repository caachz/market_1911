require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'

class ItemTest < Minitest::Test
  def test_it_exists
    item1 = Item.new({name: 'Peach', price: "$0.75"})

    assert_instance_of Item, item1
  end

  def test_it_has_a_name
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal "Tomato", item2.name
  end

  def test_it_has_a_price
    item2 = Item.new({name: 'Tomato', price: '$0.50'})

    assert_equal "$0.50", item2.price
  end
end
