require 'spec_helper'

describe 'Sign up modal' do
  it 'allows a new user to sign up', :js do
    p Capybara.current_driver
    visit '/'
    click_link 'Sign up'
    fill_in :Name, 'some'
    fill_in :Email, 'some@test.com'
    fill_in :Password, '123123123'
    fill_in :Password_confirmation, '123123123'
    save_and_open_page
  end
end
