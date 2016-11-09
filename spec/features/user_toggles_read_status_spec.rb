require 'rails_helper'

RSpec.feature "user successfully toggles read status", js: true do
  scenario "read url can be marked as unread" do
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

    within(".create-link") do
      fill_in "Url", with: "http://lab.hakim.se/blob/03/"
      fill_in "Title", with: "DopeBlob"
      click_on "Create Link"
    end

    expect(page).to have_content("http://lab.hakim.se/blob/03/")
    expect(page).to have_content("false")

    click_on "Mark As Read"

    expect(Link.last.read).to eq('t')
  end
end
