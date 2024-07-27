class EnoughProductsValidator < ActiveModel::Validator
  def validate(record)
    record.placements.each do |placement|
      product = placement.product
      total_quantity = record.placements.select { |p| p.product_id == product.id }.sum(&:quantity)

      if total_quantity > product.quantity
        record.errors.add(:base, "#{product.title} is out of stock, just #{product.quantity} left")
      end
    end
  end
end
