module Chess

	class Game

		attr_reader :board, :piece, :cell

		def initialize(board = Board.new, cell = Cell.new)
			@board = board
			@cell = cell
			@board.initial_positions(@board)
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
			i = 0
			while @board.check_win == false
				@board.give_player
				if i % 2 == 0
					puts "Player White plays"
				else
					puts "Player Black plays"
				end
				i += 1
				@board.move_piece(@board)
				@board.formatted_grid
			end


		end

	end

end
