require 'rails_helper'

feature "signing in." do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "Signing in via form" do
    visit '/'
    click_link 'Sign in'
    fill_in 'Name', with: user.name
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_content("Signed in successfully.")
  end
end

