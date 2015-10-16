feature "user creates mission", js: true do
  scenario "happy path, user creates mission" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_link "Sign In"
    within "#signin" do
      fill_in "user[email]", with: "spect@cles.com"
      fill_in "user[password]", with: "password"
      click_button "Sign In"
    end
    click_link "Create New Mission"
    fill_in "name", with: "project condor"
    fill_in "clue", with: "falcon"
    click_button "create mission"
    first("th").click
    within "ep" do
      expect(page).to have_content("falcon")
    end
    within "playmissions" do
      expect(page).to have_content("project condor")
    end
    within "editmissions" do
      expect(page).to have_content("project condor")
    end
  end
end
