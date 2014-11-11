require 'rails_helper'

feature "Viewing tickets" do
  before do
    textmate_2 = FactoryGirl.create(:project, name: "TextMate 2")

    FactoryGirl.create(:ticket,
      project: textmate_2,
      title: "Make it Shiny!",
      description: "Gradients! Starbursts are decent!")

    internet_explorer = FactoryGirl.create(:project,
                                            name: "internet_explorer")
    FactoryGirl.create(:ticket,
      project: internet_explorer,
      title: "Standards compliance",
      description: "Isn't a joke.")

    visit '/'
  end

  scenario "Viewing tickets for a given project" do
    click_link "TextMate 2"

    expect(page).to have_content("Make it Shiny!")
    expect(page).to_not have_content("Standards compliance")

    click_link "Make it Shiny!"
    within("#ticket h2") do
      expect(page).to have_content("Make it Shiny!")
    end

    expect(page).to have_content("Gradients! Starbursts are decent!")
  end
end