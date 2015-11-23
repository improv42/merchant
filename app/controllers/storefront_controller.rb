class StorefrontController < ApplicationController
  def index
    if params[:cat_id]
      @category = Category.find(params[:cat_id])
      @products = Product.where(category_id: @category.id)
    else
      @products = Product.all
    end
  end
end
