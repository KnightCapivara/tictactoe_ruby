# frozen_string_literal: true

# rubocop:disable Layout/LineLength

# Textos necessários para Tic-Tac-Toe
module Display
  def display_intro
    "Vamos jogar um jogo Tic-Tac-Toe | Jogo da Velha simples no console! \n\n"
  end

  def display_name_prompt(number)
    "Qual é o nome do jogador ##{number}?"
  end

  def display_symbol_prompt
    'Qual letra (ou caractere especial) você gostaria que fosse seu marcador de jogo?'
  end

  def display_first_symbol(duplicate)
    "Não pode ser '#{duplicate}'"
  end

  def display_input_warning
    "\e[31mDesculpe, essa é uma resposta inválida. Por favor, tente novamente.\e[0m"
  end

  def display_player_turn(name, symbol)
    "#{name}, por favor, coloque um numero entre (1-9) que está disponivel para colocar um '#{symbol}'"
  end

  def display_winner(player)
    "GAME OVER! #{player} é o vencedor!"
  end

  def display_tie
    "Deu empate!"
  end
end
# rubocop:enable Layout/LineLength
