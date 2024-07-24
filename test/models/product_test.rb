# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  price      :decimal(, )
#  published  :boolean
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test 'should have a positive price' do
    product = products(:one)
    product.price = -1

    assert_not product.valid?
  end
end
