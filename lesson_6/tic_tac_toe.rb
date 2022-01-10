# constants
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]] # diagonals

MAX_WINS = 3

# helper methods
def prompt(msg)
  puts "=> #{msg}"
end

game_rules = <<-DOC
  Tic tac toe is a two player game played on a 3X3 board.
  The goal is to be the first to get 3 of your mark (X or O) 
  in a row: vertically, horizontally, or diagonally.
  
DOC

greeting = <<-DOC
  
  Welcome to tic tac toe!
  The first player to get to 3 wins, is the champion.
  
  If you've never played this game before, type 'help' for game rules.
  If you're ready press 'Enter'.
DOC

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def display_board(brd, score)
  system 'clear'
  puts " You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts " --CURRENT SCORE-- (First to #{MAX_WINS} wins!)"
  puts "Player: #{score[:player]}"
  puts "Computer: #{score[:computer]}"
  puts ""
  puts "     |     |     "
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}  "
  puts "     |     |     "
  puts ""
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def initialize_score
  { player: 0, computer: 0 }
end

def who_goes_first?
  reply = nil
  loop do
    prompt "Who would you like to start the game? Type: 'player' or 'computer'"
    prompt "Press enter to let the computer choose"
    reply = gets.chomp.downcase
    break if reply == 'player' || reply == 'computer' || reply.empty?
    prompt "invalid choice!"
  end

  if reply.empty?
    reply = ['player', 'computer'].sample
  end

  reply
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  elsif current_player == 'computer'
    'player'
  end
end

def place_piece(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  elsif current_player == 'computer'
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = nil
  loop do
    prompt "choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt "invalid choice!"
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  computer_offense = computer_strategy(brd, COMPUTER_MARKER)
  computer_defense = computer_strategy(brd, PLAYER_MARKER)

  square = if computer_offense
             move(brd, computer_offense)
           elsif computer_defense
             move(brd, computer_defense)
           elsif brd[5] == INITIAL_MARKER
             5
           else
             empty_squares(brd).sample
           end
  brd[square] = COMPUTER_MARKER
end

def find_at_risk_square(line, brd, marker)
  brd.select { |k, v| line.include?(k) && v == INITIAL_MARKER }.keys.first if
  brd.values_at(*line).count(marker) == 2
end

def computer_strategy(brd, marker)
  strategy = WINNING_LINES.select do |line|
    find_at_risk_square(line, brd, marker)
  end
  strategy.empty? ? nil : strategy.sample
end

def move(brd, square)
  square.each { |sq| return sq if brd[sq] == INITIAL_MARKER }
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    return "player" if brd.values_at(*line).count(PLAYER_MARKER) == 3
    return "computer" if brd.values_at(*line).count(COMPUTER_MARKER) == 3
  end
  nil
end

def display_game_winner(brd)
  prompt "Winner: #{detect_winner(brd)}"
  prompt "hit any key to continue"
  gets
end

def display_tie
  prompt "It's a tie!"
  prompt "hit any key to continue"
  gets
end

def display_ultimate_winner(score)
  if score[:player] == MAX_WINS
    prompt "You are the ultimate winner"
  elsif score[:computer] == MAX_WINS
    prompt "Computer wins!"
    puts ""
  end
end

def ultimate_winner?(score)
  score[:player] == MAX_WINS || score[:computer] == MAX_WINS
end

def update_scores!(score, brd)
  case detect_winner(brd)
  when 'player' then score[:player] += 1
  when 'computer' then score[:computer] += 1
  end
end

def play_again?
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('n') ? false : true
end

# game starts
prompt(greeting)
if gets.chomp.downcase == 'help'
  prompt(game_rules)
end

# Main loop: First to MAX_WINS, wins.
loop do
  score = initialize_score

  current_player = who_goes_first?
  prompt "#{current_player} goes first."

  # inner game loop
  loop do
    board = initialize_board

    loop do
      display_board(board, score)
      place_piece(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    update_scores!(score, board)
    display_board(board, score)

    if someone_won?(board)
      display_game_winner(board)
    else
      display_tie
    end

    break if ultimate_winner?(score)
  end

  display_ultimate_winner(score)

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe. Bye!"
