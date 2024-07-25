# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  setup do
    @order = orders(:one)
    @product_one = products(:one)
    @product_two = products(:two)
  end

  test 'should set total' do
    order = Order.new user_id: @order.user_id
    order.products << products(:one)
    order.products << products(:two)
    order.save

    assert_equal (@product_one.price + @product_two.price), order.total
  end

  test 'builds 2 placements for the order' do
    @order.build_placements_with_product_ids_and_quantities [
      { product_id: @product_one.id, quantity: 2 },
      { product_id: @product_two.id, quantity: 3 }
    ]

    assert_difference('Placement.count', 2) do
      @order.save
    end
  end

  test 'an order should command not too much product than available' do
    @order.placements << Placement.new(product_id: @product_two.id, quantity: (1 + @product_two.quantity))

    assert_not @order.valid?
  end
end
