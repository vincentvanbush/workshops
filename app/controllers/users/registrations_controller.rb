class Users::RegistrationsController < Devise::RegistrationsController

  def edit
    add_breadcrumb "Edit account"
    super
  end

  def new
    add_breadcrumb "Sign up"
    super
  end
end
