class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items, dependent: :destroy

  PAYMENT_TYPES = ['Credit Card', 'Paypal', 'Check', 'Cash']

  validates :ship_name, :ship_address, :payment_type, presence: true
  validates :payment_type, inclusion: PAYMENT_TYPES

  def add_line_items_from_cart(cart)
    cart.line_items.each do |item|
      item.cart_id = nil
      line_items << item
    end
  end

  def subtotal
    line_items.to_a.sum{|item| item.total_price}
  end

end

# == Schema Information
#
# Table name: orders
#
#  id           :integer          not null, primary key
#  ship_name    :string
#  ship_address :text
#  payment_type :string
#  user_id      :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_orders_on_user_id  (user_id)
#
