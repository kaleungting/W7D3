require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content("Create an account")
  end
  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
    # visit new_user_url

      # visit new_user_url
      # page.fill_in 'username', with: 'kenting'
      # page.fill_in 'password', with: 'password'
      # click_button("Sign Up")
      # expect(page).to have_content("Welcome kenting")
      sign_up("kenting")
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login' do
    # visit new_user_url
    sign_up("kenting")
    log_in("kenting")
    # visit new_session_url
    # page.fill_in 'username', with: 'kenting'
    # page.fill_in 'password', with: 'password'
    # click_button("Log In")
    # expect(page).to have_content("Welcome kenting")
  end

end

feature 'logging out' do
  scenario 'begins with a logged out state' do
    visit users_url
    expect(page).to have_content "Log In"
    # sign_up("kenting")
    # log_in("kenting")
  end


  scenario 'doesn\'t show username on the homepage after logout' do
    sign_up("kenting")
    log_in("kenting")
    click_button("Log Out")
    expect(page).not_to have_content "kenting"
  end

end