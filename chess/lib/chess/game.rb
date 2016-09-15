module Chess

	class Game

		attr_reader :board, :piece, :cell

		def initialize(board = Board.new, piece = Piece.new, cell = Cell.new)
			@board = board
			@piece = piece
			@cell = cell
			@piece.initial_positions(@board)
		end

		def check_win(board = @board)
			white, black, win = false, false, false

			board.each do |line|
				line.each do |cell|
					if cell.value == :WG
						white = true
					end
					if cell.value == :BG
						black = true
					end
				end
			end

			if black == false
				puts "Player White wins!"
				win = true
			elsif white == false
				puts "Player Black wins!"
				win = true
			else
				win = false				
			end

		end

		def play
			@board.formatted_grid

		end

	end

end
