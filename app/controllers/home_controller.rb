class HomeController < ApplicationController

  def index

  end

  def try_now
    if sign_in User.ne(_type: :Admin).first
      redirect_to foundations_path, notice: 'Signed in as a test user!'
    else
      redirect_to root_path, notice: 'Test user not found. Please create one yourself.'
    end
  end

  def about

  end
end
