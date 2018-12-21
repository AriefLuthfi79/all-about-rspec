require 'rails_helper'

RSpec.feature "Allow admin to unroled user" do
  scenario "successfully" do
    login_as FactoryBot.create(:admin)
    visit root_path

    click_on "Create new user"
    fill_in "Email", with: "arief@gmail.com"
    click_button "Submit"

    click_on "Make admin", match: :first
    click_on "Cancel admin", match: :first

    expect(page).not_to have_css '.users li.admined', text: "arief@gmail.com"
    expect(page).to have_css '.users li', text: "arief@gmail.com"
  end
    
end
