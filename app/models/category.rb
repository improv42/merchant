# Defines the categories
class Category < ActiveRecord::Base
  has_many :products

  validates :name, presence: true, uniqueness: true
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
