require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "user is logged out and sees dashboard page" do
    visit login_path
    click_on "Create Account"

    within(".new-user") do
      fill_in "Username", with: "karinamzalez"
      fill_in "Password", with: "password"
      fill_in "Email", with: "email@example.com"
      click_on "Create Account"
    end

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content "Logged in as karinamzalez"

    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
  end

  scenario "user enters invalid email and gets error" do
    visit login_path
    click_on "Create Account"

    within(".new-user") do
      fill_in "Username", with: "apple"
      fill_in "Password", with: "green"
      fill_in "Email", with: "email@example.com"
      click_on "Create Account"
    end

    expect(page).to have_content "email already in use"
    expect(page).to_not have_content "Logged in as karinamzalez"
  end

end
