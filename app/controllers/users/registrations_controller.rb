class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        expire_session_data_after_sign_in!
      end
    else
      flash[:notice] = (( resource.errors.full_messages +
       [ "Please try again" ] ).uniq.join('.<br/>') + '.').html_safe
      clean_up_passwords resource
    end
    redirect_to root_path
  end

  def resource_params
    params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation)
  end
end
