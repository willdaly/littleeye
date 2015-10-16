feature "player plays mission", js: true do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @mission = FactoryGirl.create(:mission, clue: "saxophone", name: "secret mission", user_id: @user.id)
    @photo = FactoryGirl.create(:picture, answer: true, url: "http://www.righturl.com", mission_id: @mission.id)
    5.times do |index|
      FactoryGirl.create(:picture, answer: false, url: "http://www.wrongurl.com/#{index+1}", mission_id: @mission.id)
    end
    visit '/'
  end
  scenario "mission has six pictures" do
    click_link "secret mission"
    pictures = Picture.all
    expect(pictures.count).to eq(6)
  end
  # scenario "happy path, player wins mission" do
  #   click_link "secret mission"
  #   expect(page).to have_content("I spy with my little eye, something that begins with a S")
  #   expect(page).to have_content("Guesses: 5")
  #   click_link "0"
  #   expect(page).to have_content("saxophone has been spied!")
  #   expect(page).to have_no_content("I spy with my little eye, something that begins with a S")
  #   expect(page).to have_no_content("Guesses: 5")
  # end
  # scenario "sad path, player fails mission" do
  #   mission_impossible = FactoryGirl.create(:mission_impossible)
  #
  #   visit '/'
  #   click_link "mission impossible"
  #   expect(page).to have_content("I spy with my little eye, something that begins with a S")
  #   expect(page).to have_content("Guesses: 5")
  #   click_link "1"
  #   expect(page).to have_content("Guesses: 4")
  #   click_link "2"
  #   expect(page).to have_content("Guesses: 3")
  #   click_link "3"
  #   expect(page).to have_content("Guesses: 2")
  #   click_link "4"
  #   expect(page).to have_content("Guesses: 1")
  #   click_link "5"
  #   expect(page).to have_content("mission failed")
  #   expect(page).to have_no_content("I spy with my little eye, something that begins with a S")
  #   expect(page).to have_no_content("Guesses: 1")
  # end
  # scenario "happy path, user wins mission and score goes up" do
  #   user = FactoryGirl.create(:user)
  #   plus_point_mission = FactoryGirl.create(:plus_point_mission, id: 2)
  #   right_picture = FactoryGirl.create(:right_picture, id: 6, mission_id: plus_point_mission.id)
  #   visit '/'
  #   click_link "Sign In"
  #   within "#signin" do
  #     fill_in "user[email]", with: "test@test.com"
  #     fill_in "user[password]", with: "password"
  #     click_button "Sign In"
  #   end
  #   click_link "plus point mission"
  #   page.find("6").click_link
  #   expect(page).to have_content("1 Missions Completed")
  # end
end
