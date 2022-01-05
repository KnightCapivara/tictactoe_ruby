# frozen_string_literal: true

require_relative 'lib/board'
require_relative 'lib/player'
require_relative 'lib/game'
require_relative 'lib/display'

def play_game
  game = Game.new
  game.play
  repeat_game
end

def repeat_game
  puts "Você gostaria de jogar um novo jogo? Pressione 's' para sim ou 'n' para não."
  repeat_input = gets.chomp.downcase
  if repeat_input == 's'
    play_game
  else
    puts 'Obrigado por Jogar!'
  end
end

play_game
