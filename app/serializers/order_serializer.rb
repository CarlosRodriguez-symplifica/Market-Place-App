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
class OrderSerializer
  include FastJsonapi::ObjectSerializer

  attributes :total

  belongs_to :user
  has_many :products

  cache_options enabled: true, cache_length: 12.hours
end
