require 'spec_helper'
require 'rails_helper'



describe "Require Login" do
  it " directs to the users sign_up page on success" do
  	visit "/facts"
  	expect(page).to have_content("Sign In")
  end
end


feature 'User logs in' do
     scenario 'with valid email and password' do
     log_in_with 'me@you.com', 'password'
     expect(page).to have_content "facts"
end

def log_in_with(email, password)
    visit new_user_session_path
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end
end

