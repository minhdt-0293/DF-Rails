class Api::CategoriesController < ApplicationController
  skip_before_action :authenticate_user

  def index
    categories = Category.all.page(params[:page])
    total_pages = categories.total_pages
    message = "Success"
    render json: {status: :ok, message: message, categories: categories, total_pages: total_pages}
  end

  def destroy
    category = Category.find_by id: params[:id]
    category.destroy unless category.nil?
    categories = Category.all.page(params[:page])
    total_pages = categories.total_pages
    if categories.total_pages < params[:page].to_i
      categories = Category.all.page(categories.total_pages)
    end
    message = "Success"
    render json: {status: :ok, message: message, categories: categories, total_pages: total_pages}
  end
end
