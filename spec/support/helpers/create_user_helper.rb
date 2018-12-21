module Helpers
  def create_user_by_admin(email)
    click_on "Create new user"
    fill_in "Email", with: email
    click_button "Submit"
  end

  def display_users(email)
    have_css '.users li', text: email
  end

  def display_admined_user(email)
    have_css '.users li.admined', text: email
  end
end
