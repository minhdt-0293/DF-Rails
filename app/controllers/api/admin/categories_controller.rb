class Api::Admin::CategoriesController < ApplicationController
  skip_before_action :authenticate_user

  def index
    categories = Category.all.page(params[:page])
    total_pages = categories.total_pages
    categories = categories.map{|cat| cat.set_api_url(request.base_url)}
    message = "Success"
    render json: {status: :ok, message: message, categories: categories, total_pages: total_pages}
  end

  def create
    category = Category.new category_params

    if category.save
      category = category.set_api_url request.base_url
      render json: {status: :ok, category: category}
    else
      render json: {status: :bad_request, errors: category.errors}
    end
  end

  def show
    category = Category.find_by(id: params[:id]).set_api_url(request.base_url)
    message = "Success"
    render json: {status: :ok, message: message, category: category}
  end

  def update
    category = Category.find params[:id]

    category.update category_params
    render json: {status: :ok, category: category.set_api_url(request.base_url)}
  end

  def destroy
    category = Category.find_by id: params[:id]
    unless category.nil?
      Product.get_by_category_id(params[:id]).destroy_all
      category.destroy
    end
    categories = Category.all.page(params[:page])
    total_pages = categories.total_pages
    categories = categories.map{|cat| cat.set_api_url(request.base_url)}
    if total_pages < params[:page].to_i
      categories = Category.all.page(total_pages)
    end
    message = "Success"
    render json: {status: :ok, message: message, categories: categories, total_pages: total_pages}
  end

  def all_categories
    categories = Category.all.pluck :id, :name
    message = "Success"
    render json: {status: :ok, message: message, categories: categories}
  end

  private

  def category_params
    params.require(:category).permit Category::CATEGORY_ATTRIBUTES
  end
end
