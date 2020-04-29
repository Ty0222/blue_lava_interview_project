require 'rails_helper'

RSpec.describe "Get population by year", type: :system do
  it "User is presented with an input form" do
    visit populations_path
    assert_selector "input[name=year]"
    assert_selector "button[type=submit]"
  end

  context "When user enters a valid year" do
    it "shows a population figure within the same view" do
      visit populations_path

      expect(page).to have_content "You requested the population for: N/A"
      expect(page).to have_content "Population: N/A"

      fill_in "year", with: 1950
      find("button[type='submit']").click

      expect(current_path).to eq populations_path
      expect(page).to have_content "You requested the population for: 1950"
      expect(page).to have_content "Population: 151325798"
    end
  end
end
