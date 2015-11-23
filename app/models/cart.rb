class Cart < ActiveRecord::Base
  has_many :line_items

  def subtotal
    line_items.to_a.sum{|item| item.total_price}
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
