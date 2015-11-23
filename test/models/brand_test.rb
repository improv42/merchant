require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'brand attributes must not be empty' do
    brand = Brand.new
    assert_not brand.save, 'Saved brand with empty attributes'
  end

  test 'brand name should be unique' do
    brand = Brand.new
    brand.name = brands(:one).name
    assert_not brand.save, 'Saved brand with non-unique name'
  end

  test 'brand saves with all valid attributes' do
    brand = Brand.new(name:'unique_brand')
    assert brand.save, 'Brand wasn\'t saved when valid attributes supplied'
  end

end

# == Schema Information
#
# Table name: brands
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
