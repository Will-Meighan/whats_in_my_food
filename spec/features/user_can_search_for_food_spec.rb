require 'rails_helper'


feature "user can search for food" do

  scenario "user submits valid food type" do
    # As a user
    # When I visit "/"
    visit '/'

    fill_in :foods, with: "sweet potatoes"
    # And I select "Colorado" from the dropdown
    click_on "Submit"
    # And I click on "submit"
    expect(current_path).to eq(search_path)
    # Then my path should be "/search" with "foods=sweet potatoes" in the parameters
    expect(page).to have_content("10 Results")
    # And I should see a message "7 Results"

  end
end
