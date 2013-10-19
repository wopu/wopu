class SessionsController < ApplicationController
  def create
    if @user = User.sign_in(session_params)
      session[:user_id] = @user.id
      redirect_to request.referrer, notice: 'Signed in!'
    else
      redirect_to root_path, alert: 'Wrong email or password.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to request.referrer, notice: 'Signed out.'
  end

  private
  def session_params
    params.require(:user).permit(:email, :password)
  end
end
