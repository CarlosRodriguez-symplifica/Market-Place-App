# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  total      :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  include ActiveModel::Validations

  before_validation :set_total!

  validates_with EnoughProductsValidator
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true

  belongs_to :user
  has_many :placements, dependent: :destroy
  has_many :products, through: :placements

  def set_total!
    self.total = self.placements.map { |placement| placement.product.price * placement.quantity }.sum
  end

  def build_placements_with_product_ids_and_quantities(product_ids_and_quantities)
    product_ids_and_quantities.each do |product_id_and_quantity|
      placement = placements.build(
        product_id: product_id_and_quantity[:product_id],
        quantity: product_id_and_quantity[:quantity]
      )
      yield placement if block_given?
    end
  end
end
