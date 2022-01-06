class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['HTTP_NAME'], password: ENV['HTTP_PASS']
  def show
    @total_products = Product.count
    @total_categories = Product.group(:category_id).count
  end
end
