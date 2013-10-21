class HomeController < ApplicationController

  def index

  end

  def try_now
    if sign_in User.first
      redirect_to foundations_path, notice: 'Signed in as a test user!'
    end
  end

  def about

  end
end
