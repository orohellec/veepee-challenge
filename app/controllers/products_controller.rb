class ProductsController < ApplicationController
  def index
    products = Product.includes(:user)
    @products = products.map { |product| product.data_for_index_view }
  end
end
