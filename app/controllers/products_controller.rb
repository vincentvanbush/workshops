class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :error_if_another_user, only: [:edit, :update]

  expose_decorated(:category)
  expose(:category_name) { category.name }
  expose_decorated(:products)
  expose_decorated(:product)
  expose_decorated(:user) { product.user }
  expose(:review) { Review.new }
  expose_decorated(:reviews, ancestor: :product)

  add_breadcrumb :category_name, :category

  def index
    add_breadcrumb "All products", category_products_path(category)
  end

  def show
    add_breadcrumb product.title, category_product_path(category, product)
  end

  def new
    add_breadcrumb "New product", new_category_product_path(category)
  end

  def edit
    add_breadcrumb product.title, category_product_path(category, product)
    add_breadcrumb "Edit", edit_category_product_path(category, product)
  end

  def create
    self.product = Product.new(product_params)
    product.user = current_user

    if product.save
      category.products << product
      redirect_to category_product_url(category, product), notice: 'Product was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if self.product.update(product_params)
      redirect_to category_product_url(category, product), notice: 'Product was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /products/1
  def destroy
    product.destroy
    redirect_to category_url(product.category), notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :category_id)
  end

  def error_if_another_user
    redirect_to category_product_url(category, product), flash: { error: 'You are not allowed to edit this product.' } if current_user != product.user
  end
end
