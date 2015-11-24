class Cart < ActiveRecord::Base
  # If we delete the cart, Rails should also delete the line items
  # associated with the cart
  has_many :line_items, dependent: :destroy

  def subtotal
    line_items.to_a.sum{|item| item.total_price}
  end

  def add_product(product_id)
    product = Product.find(product_id)
    # Check if product is already in the cart
    current_item = line_items.find_by(product_id: product_id)
    if current_item
      # update quantity
      current_item.quantity += 1
    else
      # create new line item
      current_item = line_items.build(product: product, price: product.current_price)
    end
    current_item
  end
end

# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
