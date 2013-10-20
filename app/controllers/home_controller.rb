class HomeController < ApplicationController

  def index

  end

  def try_now
    if sign_in User.find_by(email: 'test@test.com', password: '123123')
      redirect_to foundations_path, notice: 'Signed in as a test user!'
    end
  end
end
