require 'rails_helper'

RSpec.feature "Allow admin to roled user" do
  scenario "successfully" do
    login_as FactoryBot.create(:admin)
    visit root_path

    create_user_by_admin "arief@gmail.com"
    click_on "Make admin", match: :first
    expect(page).to display_admined_user "arief@gmail.com"
  end
end
