require 'spec_helper'

describe 'Sign up modal' do
  it 'allows a new user to sign up', :js do
    visit '/'
    click_link 'Sign up'
    old_count = User.all.size
    within '#userModal' do
      fill_in 'user[name]', with: 'some'
      fill_in 'user[email]', with: 'some@test.com'
      fill_in 'user[password]', with: '123123123'
      fill_in 'user[password_confirmation]', with: '123123123'
      find('input[type=submit]').click
      User.all.size.should == old_count + 1
    end

    visit '/'
    click_link 'Sign up'
    old_count = User.all.size
    within '#userModal' do
      fill_in 'user[name]', with: 'some'
      fill_in 'user[email]', with: 'some@test.com'
      fill_in 'user[password]', with: '123123123'
      fill_in 'user[password_confirmation]', with: '123123123'
      find('input[type=submit]').click
      User.all.size.should == old_count
    end

    current_path.should == '/'

    visit '/'
    click_link 'Sign up'
    old_count = User.all.size
    within '#userModal' do
      fill_in 'user[name]', with: 'some'
      fill_in 'user[email]', with: 'some@test.com'
      fill_in 'user[password]', with: '123123123'
      fill_in 'user[password_confirmation]', with: '123123123'
      find('input[type=submit]').click
      User.all.size.should == old_count + 1
    end


  end
end

