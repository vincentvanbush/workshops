class Users::SessionsController < Devise::SessionsController

  def new
    add_breadcrumb "Sign in"
    super
  end
end
