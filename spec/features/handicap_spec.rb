require 'spec_helper'

feature 'Golf Handicap' do
  before do
    User.create(email: 'bob@example.com', first_name: 'Bob', last_name: 'Smith', password: 'password')
  end

  scenario 'A user who logs in will redirect to their profile page' do
    visit root_path
    click_on 'Login'
    fill_in 'user[email]', with: 'bob@example.com'
    fill_in 'user[password]', with: 'password'
    within 'form' do
      click_on 'Login'
    end

    expect(page).to have_content 'Welcome, Bob Smith!'

  end
end