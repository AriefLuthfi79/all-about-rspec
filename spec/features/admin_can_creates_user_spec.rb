require 'rails_helper'

RSpec.feature "Admin can creates user" do
  scenario "successfully" do
    login_as FactoryBot.create(:admin)
    visit root_path

    click_on "Create new user"
    fill_in "Email", with: "arief@gmail.com"
    click_on "Submit"

    expect(page).to have_css '.users li', text: "arief@gmail.com"
  end

  scenario "unsuccessfully" do
    login_as FactoryBot.create(:user)
    visit root_path

    click_on "Create new user"
    expect(page).to have_current_path(root_path)
  end
end
