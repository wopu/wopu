class SessionsController < ApplicationController
  def create
    if @user = User.sign_in(session_params)
      session[:id] = @user.id
      redirect_to after_sign_in_path
    else
      redirect_to root_path, alert: 'Wrong email or password.'
    end
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
