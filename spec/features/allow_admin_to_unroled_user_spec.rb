require 'rails_helper'

RSpec.feature "Allow admin to unroled user" do
  scenario "successfully" do
    login_as FactoryBot.create(:admin)
    visit root_path

    create_user_by_admin "arief@gmail.com"
    click_on "Make admin", match: :first
    click_on "Cancel admin", match: :first

    expect(page).not_to display_admined_user "arief@gmail.com"
    expect(page).to display_users "arief@gmail.com"
  end
    
end
