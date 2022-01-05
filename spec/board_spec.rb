# frozen_string_literal: true

# rubocop:disable Layout/LineLength, Metrics/BlockLength

require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#update_board' do
    context 'tabuleiro novo' do
      it 'updates cells[index]' do
        player_input = 0
        player_symbol = 'x'
        board.update_board(player_input, player_symbol)
        updated_board = board.cells
        updated_index_zero = ['x', 2, 3, 4, 5, 6, 7, 8, 9]
        expect(updated_board).to eq(updated_index_zero)
      end
    end

    context 'tabuleiro sendo usado' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 3, 'o', 5, 6, 'x', 8, 9])
      end

      it 'updates cells[index]' do
        player_input = 1
        player_symbol = 'o'
        board.update_board(player_input, player_symbol)
        updated_board = board.cells
        updated_index_one = ['x', 'o', 3, 'o', 5, 6, 'x', 8, 9]
        expect(updated_board).to eq(updated_index_one)
      end
    end
  end

  describe '#valid_move?' do
    context 'tabuleiro novo' do
      it 'movimento valido' do
        player_move = board.valid_move?(3)
        expect(player_move).to be true
      end
    end

    context 'escolha da celula que esta aberta' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end

      it 'movimento valido' do
        open_move = board.valid_move?(4)
        expect(open_move).to be true
      end
    end

    context 'escolha da celula que esta ocupada' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end

      it 'movimento nao valido' do
        occupied_move = board.valid_move?(9)
        expect(occupied_move).to be false
      end
    end
  end

  describe '#full?' do
    context 'tabuleiro novo' do
      it 'nao esta completo' do
        expect(board).not_to be_full
      end
    end

    context 'tabuleiro parcialmente usado' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'o', 4, 5, 'o', 'x', 8, 'o'])
      end

      it 'nao esta completo' do
        expect(board).not_to be_full
      end
    end

    context 'Tabuleiro esta completo' do
      before do
        board.instance_variable_set(:@cells, %w[x x o o x o x o o])
      end

      it 'esta completo' do
        expect(board).to be_full
      end
    end
  end

  describe '#game_over?' do
    context 'tabuleiro novo' do
      it 'jogo nao acabou' do
        expect(board).not_to be_game_over
      end
    end

    context 'tabuleiro meio-jogado' do
      before do
        board.instance_variable_set(:@cells, ['x', 2, 'x', 4, 5, 'o', 'o', 8, 'o'])
      end

      it 'jogo nao acabou' do
        expect(board).not_to be_game_over
      end
    end

    context '3 na horizontal em linha' do
      before do
        board.instance_variable_set(:@cells, ['x', 'x', 'x', 4, 5, 'o', 'o', 8, 'o'])
      end

      it 'fim de jogo' do
        expect(board).to be_game_over
      end
    end

    context '3 na vertical em linha' do
      before do
        board.instance_variable_set(:@cells, ['x', 'o', 3, 4, 'o', 'x', 7, 'o', 'x'])
      end

      it 'fim de jogo' do
        expect(board).to be_game_over
      end
    end

    context '3 na diagonal em linha' do
      before do
        board.instance_variable_set(:@cells, ['o', 2, 'x', 4, 'o', 'x', 7, 'x', 'o'])
      end

      it 'fim de jogo' do
        expect(board).to be_game_over
      end
    end
  end
end

# rubocop:enable Layout/LineLength, Metrics/BlockLength
