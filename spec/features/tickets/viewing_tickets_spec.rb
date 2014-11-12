require 'rails_helper'

feature "Viewing tickets" do
  let!(:user) { FactoryGirl.create(:user) }

  let!(:project) { FactoryGirl.create(:project, name: "TextMate 2") }
  let!(:ticket) { FactoryGirl.create(:ticket,
      project: project,
      title: "Make it Shiny!",
      description: "Gradients! Starbursts are decent!",
      user: user) }

  let!(:project2) { FactoryGirl.create(:project,
      name: "internet_explorer") }
  let!(:ticket2) { FactoryGirl.create(:ticket,
      project: project2,
      title: "Standards compliance",
      description: "Isn't a joke.",
      user: user) }

  before do
    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link project.name

    expect(page).to have_content(ticket.title)
    expect(page).to_not have_content(ticket2.title)

    click_link ticket.title
    within("#ticket h2") do
      expect(page).to have_content(ticket.title)
    end

    expect(page).to have_content(ticket.description)
  end
end