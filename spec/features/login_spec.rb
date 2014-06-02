require 'spec_helper'

feature 'User can login' do
  before do
    User.create!(email: 'bob@example.com', first_name: 'Bob', last_name: 'Smith', password: 'password')
  end

  scenario 'User can login with email and password' do
    visit root_path
    click_on 'Login'
    fill_in 'user[email]', with: 'bob@example.com'
    fill_in 'user[password]', with: 'password'
    within 'form' do
      click_on 'Login'
    end

    expect(page).to have_content 'Bob'

  end
end