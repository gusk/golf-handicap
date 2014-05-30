require 'spec_helper'

feature "Registration" do
  scenario 'A user cannot login if they leave first name, last name, email, or password blank' do

    visit new_user_path

    within 'form' do
      click_on "Register"
    end

    expect(page).to have_content 'Password can\'t be blank'
    expect(page).to have_content 'Email can\'t be blank'
    expect(page).to have_content 'First name can\'t be blank'
    expect(page).to have_content 'Last name can\'t be blank'
  end

  scenario 'A user can register' do
    visit new_user_path

    fill_in "user[first_name]", with: "gus@example.com"
    fill_in "user[first_name]", with: "gus@example.com"
    fill_in "user[email]", with: "gus@example.com"
    fill_in "user[password]", with: "1234abcd"
    within 'form' do
      click_on "Register"
    end
  end


  #scenario "A logged out user can register, sign out, and sign in" do
  #  visit "/"
  #  click_link "Register"
  #
  #  fill_in "Email", with: "hunter@example.com"
  #  fill_in "Password", with: "1234abcd"
  #  click_on "Register"
  #
  #  expect(page).to have_content "Welcome, hunter@example.com"
  #  expect(page).to have_no_content "Regsiter"
  #
  #  click_link "Sign out"
  #  expect(page).to have_no_content "Welcome, hunter@example.com"
  #
  #  click_link "Login in"
  #
  #  fill_in "Email", with: "hunter@example.com"
  #  fill_in "Password", with: "1234abcd"
  #  click_on "Sign in"
  #
  #  expect(page).to have_content "Welcome, hunter@example.com"
  #end
end