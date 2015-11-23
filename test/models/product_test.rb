require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'product attributes must not be empty' do
    product = Product.new
    product.save

    assert product.errors[:name].any?, 'Name must be present'
    assert product.errors[:description].any?, 'Description must be present'
    assert product.errors[:brand_id].any?, 'Brand must be present'
    assert product.errors[:category_id].any?, 'Category must be present'

    assert_not product.save, 'Saved product with empty attributes'
  end

  test 'product name should be unique' do
    product = Product.new
    product.name = products(:one).name
    assert_not product.save, 'Product saved with non-unique name'
  end

  test 'product price must be positive and greater than 0' do
    product = Product.new(name: 'my product', description: 'my description', category_id: 1, brand_id: 1)

    product.current_price = 0
    assert product.invalid?, 'invalid product'
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:current_price]

    product.current_price = 1
    assert product.valid?, 'valid product when should be valid'
  end

  # test 'product saves with all valid attributes' do
  #   product = Product.new(name: 'unique_product')
  #   assert product.save, 'Product wasn\'t saved when valid attributes supplied'
  # end
end

# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  current_price       :decimal(, )
#  quantity            :integer
#  description         :text
#  category_id         :integer
#  brand_id            :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#
# Indexes
#
#  index_products_on_brand_id     (brand_id)
#  index_products_on_category_id  (category_id)
#
