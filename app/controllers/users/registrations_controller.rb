class Users::RegistrationsController < Devise::RegistrationsController
  def resource_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end
end
