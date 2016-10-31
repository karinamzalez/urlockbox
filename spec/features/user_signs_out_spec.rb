require 'rails_helper'

RSpec.feature "user can successfully sign out" do
  scenario "signed in user signs out and is redirected to root" do
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

    within(".navbar-right") do
      click_on "Sign Out"
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Sign In')
  end
end
