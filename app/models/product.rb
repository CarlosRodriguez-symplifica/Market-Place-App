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
class Product < ApplicationRecord
  belongs_to :user
end
