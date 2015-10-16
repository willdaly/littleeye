feature "User signs up" do
  scenario "happy path, sucessful sign up, sign out, sign back in" do
    visit '/'
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    expect(page).to have_content("Play Missions")
    click_link "Sign Up"
    within "#signup" do
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "password"
      fill_in "user[password_confirmation]", with: "password"
      click_button "Sign Up"
    end
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("Create New Mission")
    expect(page).to have_content("0 Missions Completed")
    expect(page).to have_no_content("Sign Up")
    expect(page).to have_no_content("Sign In")
    expect(page).to have_content("Log Out")
    click_link("Log Out")
    expect(page).to have_no_content("Log Out")
    expect(page).to have_no_content("test@test.com")
    expect(page).to have_no_content("Create New Mission")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Sign In")
    click_link "Sign In"
    within "#signin" do
      fill_in "user[email]", with: "test@test.com"
      fill_in "user[password]", with: "password"
      click_button "Sign In"
    end
    expect(page).to have_content("test@test.com")
    expect(page).to have_content("Create New Mission")
    expect(page).to have_content("Missions Completed")
    expect(page).to have_no_content("Sign Up")
    expect(page).to have_no_content("Sign In")
    expect(page).to have_content("Log Out")
  end
end
