require 'rails_helper'


feature "user can search for food" do

  scenario "user submits valid food type" do
    visit '/'

    fill_in :q, with: "sweet potatoes"

    click_on "Search"

    expect(current_path).to eq(foods_path)

    expect(page).to have_content("10 Results")

    expect(page).to have_css(".food", count: 10)

    within(first(".food")) do
      expect(page).to have_css(".description")
      expect(page).to have_css(".brandOwner")
      expect(page).to have_css(".ingredients")
      expect(page).to have_css(".gtinUpc")
    end
  end
end
