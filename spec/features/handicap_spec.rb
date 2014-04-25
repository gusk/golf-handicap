require 'spec_helper'

feature 'Golf Handicap' do
  scenario 'User is able to upload an image of a scorecard' do
    visit '/'
    click_link 'Handicap Homepage'
  end
end