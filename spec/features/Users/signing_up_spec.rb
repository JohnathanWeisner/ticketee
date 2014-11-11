require 'rails_helper'

feature "Signing Up" do
  scenario "New user signs up" do
    visit "/"

    click_link "Sign up"
    fill_in "Name", with: "Johnathan"
    fill_in "Email", with: "joweisner@gmail.com"
    fill_in "Password", with: "BestPassword123"
    fill_in "Password confirmation", with: "BestPassword123"
    click_button "Sign up"

    expect(page).to have_content("You have signed up successfully.")
  end
end