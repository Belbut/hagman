# MessageDisplay stores every message that will be displayed to the player during the game
module MessageDisplay
  def display_game_intro
    clean_display
    puts 'Welcome, this simple game was created by Belbut, has a project from TOP'
    sleep 1
    clean_display
    puts 'In this project we are playing hangman!'
    puts "You will have to guess a word that is 5 to 12 charaters long. \n\n"
    puts 'You can also try to guess wich letters are pressent on the secret word.'
    puts 'Good luck!'
    sleep 3
    clean_display
  end

  def display_load_prompt
    puts 'Would you like to load last saved file? [yes/no]'
  end

  def display_do_load_message
    puts 'Hangman game loaded'
    sleep 2
    clean_display
  end

  def display_game_template
    clean_display
    puts "[Hangman by Belbut]\n\n"
    puts "Current state: #{current_word_guess.join(' ')}"
    puts "Past chart guesses: #{@hash_guess_inputs[:wrong_chars]}"
    puts "Past word guesses: #{@hash_guess_inputs[:wrong_words]}"
    puts "You have #{@game_lifes_left} lifes left"
    puts 'You can save the game, by printing: "save"'
    puts '_______________________________________________________'
  end

  def display_player_guess_prompt
    puts 'What guess word or charater do you want to try?'
  end

  def display_player_guess_empty
    puts 'Your input was empty please insert your guess:'
  end

  def display_player_repeating_guess
    puts "Why would you wan't to repeate the same guess??"
  end

  def display_winning_message
    puts "Congratulations you won!, with still #{game_lifes_left} lifes left"
  end

  def display_lossing_message
    clean_display
    puts "Last guess: #{current_word_guess.join(' ')}"
    puts "That's a piety, you lost the game :("
    puts "The secret word was: #{@secret_word.join}\n\n"
  end

  def display_correct_char_guess(guess)
    puts "The char #{guess} is present in the secret word"
  end

  def display_incorrect_char_guess(guess)
    puts "The char #{guess} DOESN'T exist secret word"
  end

  def display_incorrect_word_guess(guess)
    puts "The word #{guess} IS NOT the secret word"
  end

  private

  def clean_display
    system 'clear' or system 'cls'
  end
end
