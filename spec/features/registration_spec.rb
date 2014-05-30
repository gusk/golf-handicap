require 'spec_helper'

feature "Registration" do
  scenario "A logged out user can register, sign out, and sign in" do
    visit "/"
    click_link "Register"

    fill_in "Email", with: "hunter@example.com"
    fill_in "Password", with: "1234abcd"
    click_on "Register"

    expect(page).to have_content "Welcome, hunter@example.com"
    expect(page).to have_no_content "Regsiter"

    click_link "Sign out"
    expect(page).to have_no_content "Welcome, hunter@example.com"

    click_link "Login in"

    fill_in "Email", with: "hunter@example.com"
    fill_in "Password", with: "1234abcd"
    click_on "Sign in"

    expect(page).to have_content "Welcome, hunter@example.com"
  end
end
