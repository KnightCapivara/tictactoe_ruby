# frozen_string_literal: true

# O jogo precisa de dois jogadores!
class Player
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
  end
end
