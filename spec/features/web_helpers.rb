def sign_in_and_play
  visit "/"
  fill_in :first_player, with: "Alex"
  fill_in :second_player, with: "Zeeshan"
  click_button "submit"
end
def attack
  click_link "Attack"
  click_link "Ok"
end

def attack_till_death
  sign_in_and_play
  attack
  attack
  attack
  attack
  attack
  attack
  attack
  attack
  attack
  attack
  click_link "Attack"
end
