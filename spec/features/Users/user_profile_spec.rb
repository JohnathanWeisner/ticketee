require 'rails_helper'

feature "Profile page" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "viewing" do
    visit user_path(user)

    expect(page).to have_content(user.name)
    expect(page).to have_content(user.email)
  end
end


feature "Editing Users" do
  let!(:user) { FactoryGirl.create(:user) }

  before do
    visit user_path(user)
    click_link "Edit Profile"
  end

  scenario "editing" do
    fill_in "Name", with: "new_name"
    click_button "Update Profile"

    expect(page).to have_content("You have successfully updated your profile.")
  end

end