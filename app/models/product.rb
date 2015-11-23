class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :brand
  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_items

  validates :name, :description, :brand_id, :category_id, presence: true
  validates :name, uniqueness: true
  validates :current_price, numericality: {greater_than_or_equal_to: 0.01}

  has_attached_file :avatar, styles: { large: "500x500#", medium: "300x300#", thumb: "100x100#" }, default_url: ':style_missing.jpg'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  private

  def ensure_not_referenced_by_any_line_items
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
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
