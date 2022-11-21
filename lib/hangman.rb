require_relative 'game'

loop do
  Game.new.game_run

  puts 'Wanna play again? [Y/N]'
  input = gets.chomp
  break if input != 'Y' && input != 'y'
end
