require 'rails_helper'

RSpec.feature "CreateNewClaims", type: :feature do
  before { visit new_claim_path }

  scenario "valid input" do
    fill_in "Claim number", :with => "CLAIMNUMBER"
    fill_in "Claimant contact", :with => "test@example.com"
    click_button "Save"
    expect(current_path).to include adjuster_inspection_calls_path
  end

  scenario "claim number blank" do
    fill_in "Claim number", :with => ""
    fill_in "Claimant contact", :with => "test@example.com"
    click_button "Save"
    expect(page).to have_text("Claim number can't be blank")
  end

  scenario "claimant contact blank" do
    fill_in "Claim number", :with => "CLAIMNUMBER"
    fill_in "Claimant contact", :with => ""
    click_button "Save"
    expect(page).to have_text("Claimant contact can't be blank")
  end

  scenario "claimant contact wrong format" do
    fill_in "Claim number", :with => "CLAIMNUMBER"
    fill_in "Claimant contact", :with => "wrongemail"
    click_button "Save"
    expect(page).to have_text("Claimant contact is not an email")
  end
end
