require 'rails_helper'

RSpec.shared_context 'select mic and camera' do 
  before do
    visit adjuster_inspection_calls_path

    select_device('div#select-mic')
    select_device('div#select-camera')

    expect(page).to have_css('div#join-room')
  end

  def select_device(selector)
    expect(page).to have_css(selector)
    
    while page.has_css?(selector) do
      click_button('Apply')
      sleep 5
    end
  end

  def expect_no_active_video
    expect(page).not_to have_css('div#participants .participant.active')
    expect(page).to have_css('div#join-room')
  end

  def expect_has_active_video
    expect(page).to have_css('div#participants .participant.active')
    expect(page).not_to have_css('div#join-room')
  end
end

RSpec.feature "InspectionCalls", type: :feature do
  describe 'join room', :js => true do
    include_context 'select mic and camera'

    scenario "valid input" do
      fill_in "Room Name", :with => "ROOMNAME"
      fill_in "User Name", :with => "Username"

      click_button('Join')
      expect_has_active_video

      click_button('Leave Room')
      expect_no_active_video
    end

    scenario "either inputs blank" do
      fill_in "Room Name", :with => ""
      fill_in "User Name", :with => "Username"

      click_button('Join')
      expect_no_active_video
    end
  end
end

