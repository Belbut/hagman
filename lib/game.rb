require_relative 'secret_word'

class Game
  include SecretWord

  attr_reader :secret_word

  def initialize
    @secret_word = chose_word(5,10)
  end
end
