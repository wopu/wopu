class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(resource_params)

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

  def update
    password(params[:user][:current_password]) if params[:password].blank?
    # remove error for blank password when there is no current password
    password('123123123') if params[:current_password].blank?

    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    if update_resource(resource, account_update_params)
      if is_navigational_format?
        flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ?
          :update_needs_confirmation : :updated
        set_flash_message :notice, flash_key
      end
      sign_in resource_name, resource, :bypass => true
    else
      flash[:notice] = (( resource.errors.full_messages +
       [ "Your details were not updated. Please try again" ] ).uniq.join('.<br/>') + '.').html_safe
      clean_up_passwords resource
    end
    redirect_to edit_user_path resource
  end

  def password(value)
    %i( password password_confirmation ).each do |key|
      params[:user][key] = value
    end
  end

  def resource_params
    params.require(:user).permit(:name, :avatar, :email, :current_password, :password, :password_confirmation)
  end

  alias_method :account_update_params, :resource_params
end
