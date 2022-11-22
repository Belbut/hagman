require_relative 'game'

def saved_path
  'saved_hangman.json'
end

loop do
  Game.new.game_run

  puts 'Wanna play again? [Y/N]'
  input = gets.chomp
  break if input != 'Y' && input != 'y'
end
