require_relative 'secret_word'
require_relative 'message_display'
require 'json'
require 'yaml'

class Game
  include SecretWord
  include MessageDisplay

  attr_reader :current_word_guess
  attr_accessor :hash_guess_inputs, :game_lifes_left

  def initialize
    @secret_word = chose_word(5, 12).split('')
    @game_lifes_left = 9
    @won_game = false
    @current_word_guess = Array.new(@secret_word.size, '_')
    @hash_guess_inputs = { wrong_chars: [], wrong_words: [], every_guess: [] }
    display_game_intro
    load_game
  end

  def game_run
    while game_lifes_left.positive? && @won_game == false
      display_game_template
      @game_lifes_left -= 1 if play_round == false
      sleep 1
    end
    @won_game ? display_winning_message : display_lossing_message
  end

  def save_game
    print 'Saving game...'
    sleep 1
    game_img = JSON.dump({
                           secret_word: @secret_word,
                           game_lifes_left: @game_lifes_left,
                           won_game: @won_game,
                           current_word_guess: @current_word_guess,
                           hash_guess_inputs: @hash_guess_inputs
                         })
    File.open(saved_path, 'w') do |file|
      file.puts(game_img)
    end
    puts 'Saved file'
  end

  def load_game
    display_load_prompt
    load_input = gets.chomp.downcase
    return unless load_input == 'yes'

    load_file_inputs
    display_do_load_message
  end

  private

  def load_file_inputs
    File.open(saved_path, 'r') do |file|
      line = JSON.parse(file.readline)
      @secret_word = line['secret_word']
      @game_lifes_left = line['game_lifes_left']
      @won_game = line['won_game']
      @current_word_guess = line['current_word_guess']
      @hash_guess_inputs[:wrong_chars] = line['hash_guess_inputs']['wrong_chars']
      @hash_guess_inputs[:wrong_words] = line['hash_guess_inputs']['wrong_words']
      @hash_guess_inputs[:every_guess] = line['hash_guess_inputs']['every_guess']
    end
  end
end
