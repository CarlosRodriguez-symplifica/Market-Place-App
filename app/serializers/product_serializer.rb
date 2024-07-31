# == Schema Information
#
# Table name: products
#
#  id         :bigint           not null, primary key
#  price      :decimal(, )
#  published  :boolean
#  quantity   :integer          default(0)
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class ProductSerializer
  include FastJsonapi::ObjectSerializer

  attributes :title, :price, :published, :quantity

  belongs_to :user

  cache_options enabled: true, cache_length: 12.hours
end
