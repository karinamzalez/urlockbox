require 'rails_helper'

RSpec.feature "user successfully signs in an" do
  scenario "user successfully signs in to existing account" do
    visit root_path
    click_on "Sign Up"
    expect(current_path).to eq(new_user_path)

    within(".panel-body") do
      fill_in "Username", with: "karinamzalez"
      fill_in "Password", with: "password"
      fill_in "Password confirmation", with: "password"
      fill_in "Email", with: "email@example.com"
      click_on "Sign Up"
    end

    click_on "Sign Out"
    click_on "Sign In"
    expect(current_path).to eq(login_path)

    within(".panel-body") do
      fill_in "Email", with: "email@example.com"
      fill_in "Password", with: "password"
      click_on "Sign In"
    end

    expect(current_path).to eq(links_path)
    expect(page).to have_content "Logged in as karinamzalez"
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Login"
  end
end
