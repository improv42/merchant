# Defines Brands
class Brand < ActiveRecord::Base
  has_many :products

  validates :name, presence: true, uniqueness: true
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
