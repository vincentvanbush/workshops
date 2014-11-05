class UsersController < ApplicationController
  add_breadcrumb "Users"

  def show
    @user = User.find(params[:id]).decorate
    add_breadcrumb @user.full_name, user_path(@user)
  end
end
