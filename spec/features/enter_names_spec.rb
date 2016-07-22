
feature "entering names" do
  scenario "user_enters_name" do
    sign_in_and_play
    expect(page).to have_text("Alex vs. Zeeshan")
  end
end

# As Player 1,
# So I can see how close I am to winning
# I want to see Player 2's Hit Points

feature "Hit points" do
  scenario "displaying player 2" do
    sign_in_and_play
    expect(page).to have_content("Zeeshan HP: 60")
  end

  scenario "displaying player 1" do
    sign_in_and_play
    expect(page).to have_content("Alex HP: 60")
  end


  # As Player 1,
  # So I can start to win a game of Battle,
  # I want my attack to reduce Player 2's HP by 10

  scenario "reduce player 2 HP by 10" do
    sign_in_and_play
    click_link("Attack")
    expect(page).to have_content("Zeeshan HP: 50")
  end
  scenario "reduce player 2 HP by 10" do
  sign_in_and_play
  click_link("Attack")
  click_link("Ok")
  click_link("Attack")
  expect(page).to have_content("Alex HP: 50")
end

end

# As Player 1,
# So I can win a game of Battle,
# I want to attack Player 2, and I want to get a confirmation

feature "Attack" do
  scenario "attacking player_2" do
    sign_in_and_play
    click_link("Attack")
    expect(page).to have_content("Alex attacks Zeeshan")
  end

  scenario "attacking player_1" do
    sign_in_and_play
    click_link "Attack"
    click_link "Ok"
    click_link "Attack"
    expect(page).to have_content("Zeeshan attacks Alex")
  end

end

feature '#switching turns' do
  scenario "starts with player one's turn" do
    sign_in_and_play
    expect(page).to have_content("Alex's turn")
  end
  scenario "switches turns after attack" do
    sign_in_and_play
    click_link "Attack"
    click_link "Ok"
    expect(page).to have_content("Zeeshan's turn")
  end
end

feature '#player dies' do
  scenario "second player dies" do
    attack_till_death
    expect(page).to have_content("lose")
  end
end
