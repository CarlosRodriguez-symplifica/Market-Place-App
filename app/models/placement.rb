# == Schema Information
#
# Table name: placements
#
#  id         :integer          not null, primary key
#  quantity   :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer          not null
#  product_id :integer          not null
#
# Indexes
#
#  index_placements_on_order_id    (order_id)
#  index_placements_on_product_id  (product_id)
#
# Foreign Keys
#
#  order_id    (order_id => orders.id)
#  product_id  (product_id => products.id)
#
class Placement < ApplicationRecord
  belongs_to :order
  belongs_to :product, inverse_of: :placements
end
