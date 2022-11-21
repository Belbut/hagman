# frozen_string_literal: true

# Creates a random word to play hangman from google txt file
module SecretWord
  def chose_word(min_word_size, max_word_size)
    File.open('google-10000-english-no-swears.txt', 'r') do |file|
      lines = file.readlines
      prng = Random.new
      loop do
        random_number = prng.rand(lines.size)
        line = lines[random_number].chomp
        return line if line.size.between?(min_word_size, max_word_size)
      end
    end
  end

  def play_round
    guess = guess_input
    if guess.size == 1
      char_guess(guess)
    elsif guess.split('') == @secret_word
      @won_game = true
    else
      hash_guess_inputs[:wrong_words].append(guess)
      display_incorrect_word_guess(guess)
      false
    end
  end

  private

  def guess_input
    display_player_guess_prompt
    guess = gets.chomp
    if hash_guess_inputs[:every_guess].include? guess
      display_player_repeating_guess
      guess_input
    else
      hash_guess_inputs[:every_guess].append(guess)
      guess
    end
  end

  def char_guess(guess)
    @secret_word.each_with_index do |element, index|
      current_word_guess[index] = guess if element == guess
    end
    if current_word_guess.include? guess
      display_correct_char_guess(guess)
      true
    else
      hash_guess_inputs[:wrong_chars].append(guess)
      display_incorrect_char_guess(guess)
      false
    end
  end
end
