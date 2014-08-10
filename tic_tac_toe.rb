=begin create application logic and then translate to code
1.  Initialize hash to hold data and draw board
2. create loop until winner or all aquares are filled
  a. Player prompted for an empty square (1-9)
  b. Computer selects an empty square
  c. Check for a winner or no more empty spaces
3. Put resolution to screen (winner/lose or tie)
4. Ask to play again
=end

require 'pry'

loop do
  def initialize_board
    b = {}
    (1..9).each {|position| b[position] = ' '}
    b
  end

  def draw_board(b)
    system 'clear'
    puts
    puts " 1    |2    |3"
    puts "   #{b[1]}  |  #{b[2]}  |  #{b[3]} "
    puts "      |     |"
    puts " -----+-----+-----"
    puts " 4    |5    |6"
    puts "   #{b[4]}  |  #{b[5]}  |  #{b[6]} "
    puts "      |     |"
    puts " -----+-----+-----"
    puts " 7    |8    |9"
    puts "   #{b[7]}  |  #{b[8]}  |  #{b[9]} "
    puts "      |     | "
    puts
  end

  def empty_positions(b)
    b.keys.select {|position| b[position] == ' '}
  end

  def player_picks_square(b)
    begin
      puts "=> Pick a square from (#{empty_positions(b).join(', ')})"
      position = gets.chomp.to_i
      end until empty_positions(b).include?(position)
      b[position] = 'X'
  end

  def comp_picks_square(b)
    position = empty_positions(b).sample
    b[position] = 'O'
  end

  def check_winner(b)
    winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9],[3,5,7]]
    winning_lines.each do |line|
      return 'Player' if b.values_at(*line).count('X') == 3
      return 'Computer' if b.values_at(*line).count('O') == 3
    end
      nil
  end

  b = initialize_board
  draw_board(b)

  begin
    player_picks_square(b)
    draw_board(b)
    comp_picks_square(b)
    draw_board(b)
    winner = check_winner(b)
  end until winner || empty_positions(b).empty?
  if winner
    puts "=> #{winner} won!"
  else
    puts "=> It's a tie!"
  end
  puts
  puts "=> Play again? (Y/N)"
  break if gets.chomp.downcase != 'y'
end

puts "Good bye!"




