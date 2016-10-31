require 'rails_helper'

RSpec.feature "user can create an account" do
  scenario "user creates account and sees links index page" do
    visit homepage_path
    click_on "Sign Up"
    expect(current_path).to eq(new_session_path)

    within(".new-user") do
      fill_in "Username", with: "karinamzalez"
      fill_in "Password", with: "password"
      fill_in "Email", with: "email@example.com"
      click_on "Sign Up"
    end

    expect(current_path).to eq(links_index_path)
    expect(page).to have_content "Logged in as karinamzalez"
    expect(page).to have_content "Logout"
    expect(page).to_not have_content "Login"
  end

  scenario "user ommits form field and gets error" do
    visit homepage_path
    click_on "Sign Up"
    expect(current_path).to eq(new_session_path)

    within(".new-user") do
      fill_in "Username", with: "apple"
      fill_in "Password", with: "green"
      click_on "Create Account"
    end

    expect(page).to have_content "specify an email por favor"
    expect(page).to_not have_content "Logged in as karinamzalez"
    expect(current_path).to eq(new_session_path)
  end

end
