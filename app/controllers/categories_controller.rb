class CategoriesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy, :create]
  before_action :redirect_unless_admin, only: [:new, :edit, :create, :update]
  expose(:categories)
  expose(:category)
  expose(:product) { Product.new }

  add_breadcrumb "Categories", :categories_path

  def index
  end

  def show
    add_breadcrumb category.name, category_path(category)
  end

  def new
    add_breadcrumb "New category", new_category_path
  end

  def edit
    add_breadcrumb category.name, category_path(category)
    add_breadcrumb "Edit", edit_category_path(category)
  end

  def create
    self.category = Category.new(category_params)

    if category.save
      redirect_to category, notice: 'Category was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if category.update(category_params)
      redirect_to category, notice: 'Category was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    category.destroy
    redirect_to categories_url, notice: 'Category was successfully destroyed.'
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

    def redirect_unless_admin
      if not current_user.admin?
        redirect_to new_user_session_path, flash: { error: 'You are not allowed to edit this product.' }
      end
    end
end
