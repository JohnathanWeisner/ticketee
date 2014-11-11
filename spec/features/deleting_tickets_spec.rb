require 'rails_helper'

feature "Deleting Tickets" do
  let!(:project) { FactoryGirl.create(:project, name: "Best Ever Thing") }
  let!(:ticket) { FactoryGirl.create(:ticket, project: project) }

  before do
    visit "/"
    click_link project.name
    click_link ticket.title
  end

  scenario "Able to delete a ticket" do
    click_link "Delete Ticket"

    expect(page).to have_content("Ticket has been deleted.")
    expect(page).to_not have_content(ticket.title)
    expect(page.current_url).to eq(project_url(project))

  end
end