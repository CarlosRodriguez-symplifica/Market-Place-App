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
  test 'should have a positive total' do
    order = orders(:one)
    order.total = -1
    assert_not order.valid?
  end
end
