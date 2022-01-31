SUITS = ['H', 'D', 'S', 'C']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', 'J', 'Q', 'K', 'A']
MAX_WINS = 3
GAME_NAME = 21
VALID_QUIT = %w(q quit)

game_rules = <<~MSG

  The game consists of a "dealer" and a "player". Both are 
  initially dealt 2 cards. The player can see their 2 cards, but can only see 
  one of the dealer's cards.
  
  To 'hit' is to ask for another card. To stay is hold your total.
  If both players 'stay', cards are compared. The total cards with the higher 
  value wins.
  
  CARD VALUES: The numbers 2 through 10 are worth their face value. 
  The jack, queen, and king are each worth 10, and the ace can be worth 1 or 11.
 
MSG

greeting = <<~MSG
  Welcome to 21!
  The goal of the game is to get as close to 21 as possible without going over.
  The first player that wins the game 3 times is the Grand Champion.
  
  Type 'h' for more information on the game rules OR
  if you're ready to play, press 'ENTER'.
MSG

def prompt(message)
  puts "=> #{message}"
end

def display_newline(num = 1)
  num.times { puts "" }
end

def display_round_no(num)
  display_newline(2)
  puts "ROUND #{num}"
  display_newline(1)
end

def initialise_wins
  { player: 0, dealer: 0 }
end

def initialise_deck
  SUITS.product(VALUES).shuffle
end

def reset_cards
  { player: [], dealer: [] }
end

def reset_total
  { player: 0, dealer: 0 }
end

def initial_deal(cards, deck)
  2.times do
    cards[:player] << deck.pop
    cards[:dealer] << deck.pop
  end
end

def reveal_initial_cards(cards, totals)
  display_newline(2)
  prompt "Dealer has #{cards[:dealer][0]} and unknown"
  prompt "You have #{cards[:player][0]} and #{cards[:player][1]}
  for a total of #{totals[:player]}"
  display_newline(1)
end

def initial_totals(cards, totals)
  totals[:player] = total(cards[:player])
  totals[:dealer] = total(cards[:dealer])
end

def initial_display(score, cards, deck, totals)
  display_score_board(score)
  initial_deal(cards, deck)
  initial_totals(cards, totals)
  reveal_initial_cards(cards, totals)
end

def total(cards)
  values = cards.map { |card| card[1] }
  total = values.map do |value|
    if ['J', 'Q', 'K', '1'].include?(value)
      10
    elsif value == 'A'
      11
    else
      value.to_i
    end
  end.sum
  values.count('A').times { total -= 10 if total > GAME_NAME }
  total
end

def player_choice
  choice = nil
  loop do
    prompt "Do you want to hit or stay? ('h' or 's')"
    choice = gets.chomp.downcase
    break if ['h', 'hit', 's', 'stay'].include?(choice)
    prompt "Invalid choice! please enter: (h)it or (s)tay"
  end
  choice
end

def player_stay
  select = nil
  loop do
    select = player_choice
    if select.start_with?('s')
      return true
    elsif select.start_with?('h')
      return false
    end
  end
end

def player_hit(deck, cards)
  cards[:player] << deck.pop
  prompt "You chose to hit."
  prompt "Your cards are now #{cards[:player]}"
  prompt "Your total is now #{total(cards[:player])}"
  display_newline(2)
end

def player_turn(deck, cards)
  select = nil
  display_newline(1)
  puts "YOUR TURN..."
  display_newline(1)

  loop do
    select = player_choice
    player_hit(deck, cards) if select.start_with?('h')
    break if select.start_with?('s') || busted?(cards[:player])
  end
end

def busted?(cards)
  total(cards) > GAME_NAME
end

def dealer_hit(deck, cards)
  display_newline(1)
  prompt "Dealer hits!"
  cards[:dealer] << deck.pop
  prompt "Dealer's cards are now at #{cards[:dealer]}"
  prompt "Dealer's total is now #{total(cards[:dealer])}"
  display_newline(1)
end

def dealer_turn(deck, cards)
  display_newline(1)
  puts "DEALER'S TURN..."
  loop do
    break if total(cards[:dealer]) >= 17
    dealer_hit(deck, cards)
  end
end

def compare_cards(cards)
  display_newline(1)
  puts "===================="
  prompt "Dealer has #{cards[:dealer]}
  for a total of #{total(cards[:dealer])} "
  prompt "You have #{cards[:player]}
  for a total of #{total(cards[:player])}"
  puts "===================="
  display_newline(1)
end

def detect_result(cards, totals)
  initial_totals(cards, totals)

  if totals[:player] > GAME_NAME
    :player_busted
  elsif totals[:dealer] > GAME_NAME
    :dealer_busted
  elsif totals[:dealer] < totals[:player]
    :player
  elsif totals[:player] < totals[:dealer]
    :dealer
  else
    :tie
  end
end

def display_result(cards, totals)
  result = detect_result(cards, totals)

  case result
  when :player_busted then prompt "You busted! Dealer wins!"
  when :dealer_busted then prompt "Dealer busted! You win!"
  when :player then prompt "You win!"
  when :dealer then prompt "Dealer wins!"
  when :tie then prompt "Its a tie!"
  end
end

def update_score!(score, cards, totals)
  result = detect_result(cards, totals)

  if result == :tie
    nil
  elsif result == :dealer_busted
    score[:player] += 1
  elsif result == :player_won
    score[:player] += 1
  else
    score[:dealer] += 1
  end
end

def display_score_board(score)
  display_newline(1)
  puts "  -------- SCORE --------"
  puts "   YOU: #{score[:player]} -  DEALER: #{score[:dealer]}"
  display_newline(1)
end

def display_score_msg(score)
  display_newline(1)
  puts "===================="
  prompt "Dealer has #{score[:dealer]} wins"
  prompt "You have #{score[:player]} wins"
  puts "===================="
  display_newline(1)
end

def detect_winner(cards, totals)
  result = detect_result(cards, totals)
  case result
  when :player_busted then :dealer
  when :dealer_busted then :player
  when :player then prompt :player
  when :dealer then prompt :dealer
  end
end

def grand_champion?(score)
  score[:player] == MAX_WINS || score[:dealer] == MAX_WINS
end

def display_grand_champion_msg(score)
  if score[:player] == MAX_WINS
    puts "You reached #{MAX_WINS} wins first"
    puts "You are the GRAND CHAMPION!!"
  elsif score[:dealer] == MAX_WINS
    puts "Dealer reached #{MAX_WINS} wins first"
    puts "Dealer is the GRAND CHAMPION!!"
    display_newline(1)
  end
end

def next_round?
  prompt "Next round? Press enter key to continue\n
  or hit 'q' if you wish to quit the game."
  answer = gets.chomp.downcase
  VALID_QUIT.none?(answer)
end

def play_again?
  prompt "Do you want to play again? ( (y)es or (n)o )"
  reply = gets.chomp
  reply.downcase.start_with?('y')
end

# game starts.
prompt(greeting)
reply = gets.chomp
if reply.downcase.start_with?('h')
  prompt(game_rules)
end

loop do
  round = 0
  score = initialise_wins

  loop do # game loop
    system 'clear'
    round += 1
    deck = initialise_deck
    cards = reset_cards
    totals = reset_total

    display_round_no(round)
    initial_display(score, cards, deck, totals)

    player_turn(deck, cards)
    totals[:player] = total(cards[:player])

    if busted?(cards[:player])
      display_result(cards, totals)
      score[:dealer] += 1
      display_score_msg(score)
      break if grand_champion?(score)
      next_round? ? next : break
    else
      prompt "You stayed at #{total(cards[:player])}"
    end

    dealer_turn(deck, cards) unless busted?(cards[:player])
    totals[:dealer] = total(cards[:dealer])
    if busted?(cards[:dealer])
      display_result(cards, totals)
      score[:player] += 1
      display_score_msg(score)
      break if grand_champion?(score)
      next_round? ? next : break
    else
      prompt "Dealer stays at #{total(cards[:dealer])}"
    end

    detect_result(cards, totals)
    compare_cards(cards)
    update_score!(score, cards, totals)
    break if grand_champion?(score)
  end

  system 'clear'
  display_score_msg(score)
  display_grand_champion_msg(score)
end
prompt "Thank you for playing 21! Good-bye!"
