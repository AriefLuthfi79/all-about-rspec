require 'rails_helper'

RSpec.feature "Admin can creates user" do
  scenario "successfully" do
    login_as FactoryBot.create(:admin)
    visit root_path

    create_user_by_admin "arief@gmail.com"
    expect(page).to display_users "arief@gmail.com"
  end

  scenario "unsuccessfully" do
    login_as FactoryBot.create(:user)
    visit root_path

    click_on "Create new user"
    expect(page).to have_current_path(root_path)
  end
end
