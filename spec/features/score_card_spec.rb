require 'spec_helper'

feature 'User can fill out a scorecard' do
  before do
    User.create!(email: 'bob@example.com', first_name: 'Bob', last_name: 'Smith', password: 'password')
  end

  scenario 'user can click a link to post a score' do
    visit root_path
    click_on 'Login'
    fill_in 'user[email]', with: 'bob@example.com'
    fill_in 'user[password]', with: 'password'
    within 'form' do
      click_on 'Login'
    end
    expect(page).to have_link "Post a Score"
  end

  scenario 'user can fill out an electronic score card' do
   visit new_score_card_path
  end
end