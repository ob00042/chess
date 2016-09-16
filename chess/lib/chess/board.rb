module Chess

	class Board

		attr_reader :grid

		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		def get_cell(x, y)
			grid[y][x]
		end

		def set_cell(x, y, value)
			get_cell(x, y).value = value
		end

		def formatted_grid
			i = 0
			j = 0
			puts [" ", 0, 1, 2, 3, 4, 5, 6, 7].join("  ")
      grid.each do |row|
      	arr = [i]
        row.map { |cell| arr << cell.value }
        puts arr.join(" ")
        i += 1
      end
    end

    def cell_player(cell)
			if cell.value == :WP || cell.value == :WR || cell.value == :WK || cell.value == :WB || cell.value == :WG || cell.value == :WQ
				cell.player = :player_white
			elsif cell.value == :BP || cell.value == :BR || cell.value == :BK || cell.value == :BB || cell.value == :BG || cell.value == :BQ
				cell.player = :player_black
			else
				cell.player = :empty
			end
		end

		def give_player
			grid.each do |row|
				row.each do |cell|
					cell_player(cell)
				end
			end
		end

    def check_win
			white, black, win = false, false, false

			grid.each do |row|
				row.each do |cell|
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

		def initial_positions(board)
			board.set_cell(0, 0, :BR)
			board.set_cell(1, 0, :BK)
			board.set_cell(2, 0, :BB)
			board.set_cell(3, 0, :BG)
			board.set_cell(4, 0, :BQ)
			board.set_cell(5, 0, :BB)
			board.set_cell(6, 0, :BK)
			board.set_cell(7, 0, :BR)
			board.set_cell(0, 1, :BP)
			board.set_cell(1, 1, :BP)
			board.set_cell(2, 1, :BP)
			board.set_cell(3, 1, :BP)
			board.set_cell(4, 1, :BP)
			board.set_cell(5, 1, :BP)
			board.set_cell(6, 1, :BP)
			board.set_cell(7, 1, :BP)

			board.set_cell(0, 7, :WR)
			board.set_cell(1, 7, :WK)
			board.set_cell(2, 7, :WB)
			board.set_cell(3, 7, :WG)
			board.set_cell(4, 7, :WQ)
			board.set_cell(5, 7, :WB)
			board.set_cell(6, 7, :WK)
			board.set_cell(7, 7, :WR)
			board.set_cell(0, 6, :WP)
			board.set_cell(1, 6, :WP)
			board.set_cell(2, 6, :WP)
			board.set_cell(3, 6, :WP)
			board.set_cell(4, 6, :WP)
			board.set_cell(5, 6, :WP)
			board.set_cell(6, 6, :WP)
			board.set_cell(7, 6, :WP)
		end

		def move_piece(board)
			puts "Give the X coordinate of the piece you want to move"
			x = gets.chomp
			x = x.to_i
			puts "Give the Y coordinate of the piece you want to move"
			y = gets.chomp
			y = y.to_i
			piece_name = board.get_cell(x, y).value
			case piece_name
			when :WP then move_wp(x, y, board)
			when :BP then move_bp(x, y, board)
			when :WR then move_rook(x, y, :WR, board)
			when :BR then move_rook(x, y, :BR, board)
			when :WB then move_bishop(x, y, :WB, board)
			when :BB then move_bishop(x, y, :BB, board)
			when :WK then move_knight(x, y, :WK, board)
			when :BK then move_knight(x, y, :BK, board)
			when :WQ then move_queen(x, y, :WQ, board)
			when :BQ then move_queen(x, y, :BQ, board)
			when :WG then move_king(x, y, :WG, board)
			when :BG then move_king(x, y, :BG, board)
			else
				puts "You chose an epmty cell, try again"
				self.move_piece(board)
			end
		end

		def check_path(x, y, xx, yy, board) # can refactor the last bit about checking if the player is the same in the begining, not in the end of each case!!!!

			cell_player = board.get_cell(x, y).player

			if xx >= x && yy >= y # both new coordinates are larger than older ones
				if x == xx && y != yy # x is the same, y changes
					z = y+1
					while z < yy
						if board.get_cell(x, z).value != "  "
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if board.get_cell(x, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end 
				elsif y == yy && x != xx # y is the same, x changes
					z = x + 1
					while x < xx
						if board.get_cell(z, y).value != "  "
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if board.get_cell(xx, y).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				else # both x and y change
					if xx - x != yy - y #check if x and y change by the same amount ie. diagonal
						puts "You can't make this move"
						return false
					else
						z = x + 1
						m = y + 1
						while z < xx && m < yy
							if board.get_cell(z, m).value != "  "
								puts "You can't move there"
								return false
							end
							z += 1
							m += 1
						end
						if board.get_cell(xx, yy).player == cell_player
							puts "You can't move there"
							return false
						else
							return true
						end
					end
				end
			elsif xx <= x && yy <= y # both new coordinates are smaller than the older ones
				if x == xx && y != yy # x stays the same, y changes
					z = y - 1
					while z > yy
						if board.get_cell(x, z).value != "  "
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y satys the same, x changes
					z = x - 1
					while z > xx
						if board.get_cell(z, y).value != "  "
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				else # both x and y change
					if x - xx != y - yy #check they change the same ie diagonal
						puts "You can't move there"
						return false
					else
						z = x - 1
						m = y - 1
						while z > xx && m > yy
							if board.get_cell(z, m).value != "  "
								puts "You can't move there"
								return false
							end
							z -= 1
							m -= 1
						end
						if board.get_cell(xx, yy).player == cell_player
							puts "You can't move there"
							return false
						else
							return true
						end
					end
				end
			elsif xx >= x && yy <= y # new x coordinate is bigger, and new y is smaller
				if x == xx && y != yy # x is the same, and y is smaller
					z = y - 1
					while z > yy
						if board.get_cell(x, z).value != "  "
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y is the same and x is bigger
					z = x + 1
					while z < xx
						if board.get_cell(z, y).value != "  "
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				else # y is smaller and x is bigger
					if y - yy != xx - x #check for diagonal
						puts "You can't move there"
						return false
					else
						z = x + 1
						m = y - 1
						while z < xx && m > yy
							if board.get_cell(z, m).value != "  "
								puts "You can't move there"
								return false
							end
							z += 1
							m -= 1
						end
						if board.get_cell(xx, yy).player == cell_player
							puts "You can't move there"
							return false
						else
							return true
						end
					end
				end
			elsif xx <= x && yy >= y # new x is smaller and new y is bigger
				if x == xx && y != yy # x is the same and y is bigger
					z = y + 1
					while z < yy
						if board.get_cell(x, z).value != "  "
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y is the same and x is smaller
					z = x - 1
					while z > xx
						if board.get_cell(z, y).value != "  "
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				else # y is bigger and x is smaller
					if yy - y != x - xx # check for diagonal
						puts "You can't move there"
						return false
					else
						z = x - 1
						m = y + 1
						while z > xx && y < yy
							if board.get_cell(z, m).value != "  "
								puts "You can't move there"
								return false
							end
							z -= 1
							m += 1
						end
						if board.get_cell(xx, yy).player == cell_player
							puts "You can't move there"
							return false
						else
							return true
						end
					end
				end
					
			end

		end

		def move_bp(x, y, board)
			puts "You can move one cell ahead, or attack in a diagonal cell."
			puts "If you want to move type CAPITAL 'M', else type CAPITAL 'A'."
			input = gets.chomp
			if input == "M"
				move_black_pawn(x, y, board)
			elsif input == "A"
				attackBlack_pawn(x, y, board)
			else
				puts "You gave the wrong input."
				move_piece(board)
			end
		end

		def move_black_pawn(x, y, board)
			if check_path(x, y, x, y + 1, board)
				board.set_cell(x, y + 1, :BP)
				board.set_cell(x, y, "  ")
			else
				puts "Try again"
				move_piece(board)
			end
		end

		def attack_black_pawn(x, y, board)
			cell_player = board.get_cell(x, y).player
			puts "Where do you want to attack, Right or Left? ('R'/'L')"
			direction = gets.chomp
			if direction == "R"
				if board.get_cell(x + 1, y + 1).player != cell_player
					board.set_cell(x + 1, y + 1, :BP)
					board.set_cell(x, y, "  ")
				else
					puts "You can't attack here!"
					move_piece(board)
				end
			elsif direction == "L"
				if board.get_cell(x - 1, y + 1).player != cell_player
					board.set_cell(x - 1, y + 1, :BP)
					board.set_cell(x, y, "  ")
				else
					puts "You can't attack here!"
					move_piece(board)
				end
			else
				puts "You did not give a valid direction"
				move_piece(board)
			end
					
		end

		def move_wp(x, y, board)
			puts "You can move one cell ahead, or attack in a diagonal cell."
			puts "If you want to move type CAPITAL 'M', else type CAPITAL 'A'."
			input = gets.chomp
			if input == "M"
				move_white_pawn(x, y, board)
			elsif input == "A"
				attack_white_pawn(x, y, board)
			else
				puts "You gave the wrong input."
				move_piece(board)
			end
		end

		def move_white_pawn(x, y, board)
			if check_path(x, y, x, y - 1, board)
				board.set_cell(x, y - 1, :WP)
				board.set_cell(x, y, "  ")
			else
				puts "Try again"
				move_piece(board)
			end
		end

		def attack_white_pawn(x, y, board)
			cell_player = board.get_cell(x, y).player
			puts "Where do you want to attack, Right or Left? ('R'/'L')"
			direction = gets.chomp
			if direction == "R"
				if board.get_cell(x + 1, y - 1).player != cell_player
					board.set_cell(x + 1, y - 1, :WP)
					board.set_cell(x, y, "  ")
				else
					puts "You can't attack here!"
					move_piece(board)
				end
			elsif direction == "L"
				if board.get_cell(x - 1, y - 1).player != cell_player
					board.set_cell(x - 1, y - 1, :WP)
					board.set_cell(x, y, "  ")
				else
					puts "You can't attack here!"
					move_piece(board)
				end
			else
				puts "You did not give a valid direction"
				move_piece(board)
			end
					
		end

		def move_rook(x, y, type, board) 
			puts "Type CAPITAL 'X' or 'Y' depending on the direction you want to move"
			direction = gets.chomp
			if direction == "X"
				puts "Give the new X coordinate"
				new_x = gets.chomp
				new_x = new_x.to_i
				if check_path(x, y, new_x, y, board)
					board.set_cell(new_x, y, type)
					board.set_cell(x, y, "  ")
				else
					puts "Try again"
					move_piece(board)
				end
			elsif direction == "Y"
				puts "Give the new Y coordinate"
				new_y = gets.chomp
				new_y = new_y.to_i
			  if check_path(x, y, x, new_y, board)
					board.set_cell(x, new_y, type)
					board.set_cell(x, y, "  ")
				else
					puts "Try again"
					move_piece(board)
				end
			else
				puts "You made a mistake declaring the direction, try again"
				move_rook(x, y, type, board)
			end	
			
		end

		def move_bishop(x, y, type, board)
			puts "Type the X coordinate you want to move to"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Type the Y coordinate you want to move to and make sure it is in diagonal"
			new_y = gets.chomp
			new_y = new_y.to_i
			if check_path(x, y, new_x, new_y, board)
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "  ")
			else
				puts "Try again"
				move_piece(board)
			end
		end

		def move_knight(x, y, type, board)
			cell_player = board.get_cell(x, y).player
			possible_moves = []
			position = [x, y]
			possible_combinations = [[1, 2], [2, 1], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
			possible_combinations.each do |combination|
				new_x = combination[0] + x
				new_y = combination[1] + y
				if new_x > -1 && new_x < 8 && new_y > -1 && new_y < 8 && board.get_cell(new_x, new_y).player != cell_player
					possible_moves << [new_x, new_y]
				end
				new_x = 0
				new_y = 0 
			end
			puts "The possible moves are: "
			p possible_moves
			puts "Choose a new X coordinate"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Choose a new Y coordinate"
			new_y = gets.chomp
			new_y = new_y.to_i
			if possible_moves.include? [new_x, new_y]
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "  ")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				move_piece(board)
			end
		end

		def move_queen(x, y, type, board)
			puts "You can move the Queen in straight or diagonal lines"
			puts "Give new X coordinate"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Give new Y coordinate"
			new_y = gets.chomp
			new_y = new_y.to_i
			if check_path(x, y, new_x, new_y, board)
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "  ")
			else
				puts "Try again"
				move_piece(board)
			end
		end

		def move_king(x, y, type, board)
			puts "Careful when you move the King!"
			cell_player = board.get_cell(x, y).player
			possible_moves = []
			possible_combinations = [[-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0]]
			possible_combinations.each do |combination|
				new_x = combination[0] + x
				new_y = combination[1] + y
				if new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7 && board.get_cell(new_x, new_y).player != cell_player
					possible_moves << [new_x, new_y]
				end 
			end
			puts "The possible moves are: "
			puts possible_moves
			puts "Chose a new X coordinate"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Chose a new Y coordinate"
			new_y = gets.chomp
			new_y = new_y.to_i
			if possible_combinations.include? [new_x, new_y]
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "  ")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				move_piece(board)
			end
		end

		private

		def default_grid
			Array.new(8) { Array.new(8) { Cell.new } }
		end

	end

end