require 'rails_helper'

RSpec.feature "user successfully creates link" do
  scenario "signed in user creates link" do
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

    expect(current_path).to eq(links_path)
  end
end 
