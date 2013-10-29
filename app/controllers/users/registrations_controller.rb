class Users::RegistrationsController < Devise::RegistrationsController
  def create
    ret = super
    p resource
    p params
    p resource_params
    p resource.errors
    ret
  end

  def resource_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end
end
