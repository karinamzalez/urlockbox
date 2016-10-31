require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "user creates account and sees links index page" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    within(".panel-body") do
      fill_in "Username", with: "karinamzalez"
      fill_in "Password", with: "password"
      fill_in "Email", with: "email@example.com"
      click_on "Sign Up"
    end

    expect(current_path).to eq(links_path)
    expect(page).to have_content "Logged in as karinamzalez"
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Login"
  end

  scenario "user ommits form field and gets error" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    within(".panel-body") do
      fill_in "Username", with: "apple"
      fill_in "Password", with: "green"
      click_on "Sign Up"
    end

    expect(current_path).to eq(users_path)
    expect(page).to have_content "Email can't be blank"
    expect(page).to_not have_content "Logged in as karinamzalez"
  end

end
