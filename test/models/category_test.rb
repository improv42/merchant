require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'category attributes must not be empty' do
    category = Category.new
    assert_not category.save, 'Category saved with blank attributes'
  end

  test 'category name should be unique' do
    category = Category.new
    category.name = categories(:one).name
    assert_not category.save, 'Category saved with non-unique name'
  end

  test 'category saves with all valid attributes' do
    category = Category.new(name: 'unique_category')
    assert category.save, 'Category wasn\'t saved when valid attributes supplied'
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
