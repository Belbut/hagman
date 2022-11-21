require_relative 'secret_word'
require_relative 'message_display'

class Game
  include SecretWord
  include MessageDisplay

  attr_reader :current_word_guess
  attr_accessor :hash_guess_inputs, :game_lifes_left

  def initialize
    @secret_word = chose_word(5, 12).split('')
    @game_lifes_left = 7
    @won_game = false
    @current_word_guess = Array.new(@secret_word.size, '_')
    @hash_guess_inputs = { wrong_chars: [], wrong_words: [], every_guess: [] }
    display_game_intro
  end

  def game_run
    while game_lifes_left.positive? && @won_game == false
      display_game_template
      self.game_lifes_left -= 1 if play_round == false
      sleep 1
    end
    @won_game ? display_winning_message : display_lossing_message
  end
end
