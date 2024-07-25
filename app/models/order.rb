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
class Order < ApplicationRecord
  validates :total, numericality: { greater_than_or_equal_to: 0 }
  validates :total, presence: true

  belongs_to :user
end
