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

  test 'should filter products by name' do
    assert_equal 2, Product.filter_by_title('tv').count
  end

  test 'should filter products by name and sort them' do
    assert_equal [products(:another_tv), products(:one)], Product.filter_by_title('tv').sort
  end

  test 'should filter products by price and sort then' do
    assert_equal [products(:two), products(:one)], Product.above_or_equal_to_price(200).sort
  end

  test 'should filter products by price lower and sort them' do
    assert_equal [products(:another_tv)], Product.below_or_equal_to_price(200).sort
  end

  test 'should sort product by most recent' do
    products(:two).touch

    assert_equal [products(:another_tv), products(:one), products(:two)], Product.recent.to_a
  end
end
