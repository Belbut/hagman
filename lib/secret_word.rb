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
end
