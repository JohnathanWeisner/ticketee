require 'rails_helper'

feature "Editing tickets" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:project) { FactoryGirl.create(:project) }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project, user: user) }

  before do
    sign_in_as!(user)
    visit '/'
    click_link project.name
    click_link ticket.title
    click_link "Edit Ticket"
  end

  scenario "Updating a ticket" do
    fill_in "Title", with: "A better name"
    fill_in "Description", with: "A better description"
    click_button "Update Ticket"

    expect(page).to have_content("Ticket has been updated")

    within("#ticket h2") do
      expect(page).to have_content("A better name")
    end

    expect(page).to_not have_content ticket.title
  end

  scenario "Updating a ticket with invalid information" do
    fill_in "Description", with: "Too Short"
    click_button "Update Ticket"

    message = "Description must be longer than 10 characters."

    expect(page).to have_content(message)
    expect(page).to have_content("Ticket has not been updated.")
  end
end