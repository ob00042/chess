module Chess

	class Piece

		attr_reader :color, :name, :white_king, :white_queen, :white_bishop, :white_knight, :white_rook, :white_pawn, :black_king, :black_queen, :black_bishop, :black_knight, :black_rook, :black_pawn

		def initialize(color = "", name = "")
			@color = color
			@name = name
		end

		def create_pieces
			@white_king = Piece.new(:white, :WG)
			@white_queen = Piece.new(:white, :WQ)
			@white_bishop = Piece.new(:white, :WB)
			@white_knight = Piece.new(:white, :WK)
			@white_rook = Piece.new(:white, :WR)
			@white_pawn = Piece.new(:white, :WP)
			@black_king = Piece.new(:black, :BG)
			@black_queen = Piece.new(:black, :BQ)
			@black_bishop = Piece.new(:black, :BB)
			@black_knight = Piece.new(:black, :BK)
			@black_rook = Piece.new(:black, :BR)
			@black_pawn = Piece.new(:black, :BP)
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
			piece_name = board.get_cell(x, y).vallue
			case piece_name
			when :WP then White_Pawn.move(x, y, board)
			when :BP then Black_Pawn.moves(x, y, board)
			when :WR then Rook.move(x, y, :WR, board)
			when :BR then Rook.move(x, y, :BR, board)
			when :WB then Bishop.move(x, y, :WB, board)
			when :BB then Bishop.move(x, y, :BB, board)
			when :WK then Knight.move(x, y, :WK, board)
			when :BK then Knight.move(x, y, :BK, board)
			when :WQ then Queen.move(x, y, :WQ, board)
			when :BQ then Queen.move(x, y, :BQ, board)
			when :WG then King.move(x, y, :WG, board)
			when :BG then King.move(x, y, :BG, board)
			else
				puts "You chose an epmty cell, try again"
				Piece.move_piece(board)
			end
		end

		def check_path(x, y, xx, yy, board) # can refactor the last bit about checking if the player is the same in the begining, not in the end of each case!!!!

			cell_player = board.get_cell(x, y).player

			if xx >= x && yy >= y # both new coordinates are larger than older ones
				if x == xx && y != yy # x is the same, y changes
					z = y+1
					while z < yy
						if board.get_cell(x, z).value != ""
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
						if board.get_cell(z, y).value != ""
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
							if board.get_cell(z, m).value != ""
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
						if board.get_cell(x, z).value != ""
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
						if board.get_cell(z, y).value != ""
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
							if board.get_cell(z, m).value != ""
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
						if board.get_cell(x, z).value != ""
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
						if board.get_cell(z, y).value != ""
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
							if board.get_cell(z, m).value != ""
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
						if board.get_cell(x, z).value != ""
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
						if board.get_cell(z, y).value != ""
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
							if board.get_cell(z, m).value != ""
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

	end

	class Black_Pawn < Piece # NEED TO ADD ATTACK!!!!!

		def move(x, y, board)
			puts "You can move one cell ahead, or attack in a diagonal cell."
			puts "If you want to move type CAPITAL 'M', else type CAPITAL 'A'."
			input = gets.chomp
			if input == "M"
				Black_Pawn.move_black_pawn(x, y, board)
			elsif input == "A"
				Black_Pawn.attack(x, y, board)
			else
				puts "You gave the wrong input."
				Piece.move_piece(board)
			end
		end

		def move_black_pawn(x, y, board)
			if Piece.check_path(x, y, x, y + 1, board)
				board.set_cell(x, y + 1, :BP)
				board.set_cell(x, y, "")
			else
				puts "Try again"
				Piece.move_piece(board)
			end
		end

		def attack(x, y, board)
			cell_player = board.get_cell(x, y).player
			puts "Where do you want to attack, Right or Left? ('R'/'L')"
			direction = gets.chomp
			if direction == "R"
				if board.get_cell(x + 1, y + 1).player != cell_player
					board.set_cell(x + 1, y + 1, :BP)
					board.set_cell(x, y, "")
				else
					puts "You can't attack here!"
					Piece.move_piece(board)
				end
			elsif direction == "L"
				if board.get_cell(x - 1, y + 1).player != cell_player
					board.set_cell(x - 1, y + 1, :BP)
					board.set_cell(x, y, "")
				else
					puts "You can't attack here!"
					Piece.move_piece(board)
				end
			else
				puts "You did not give a valid direction"
				Piece.move_piece(board)
			end
					
		end

	end

	class White_Pawn < Piece

		def move(x, y, board)
			puts "You can move one cell ahead, or attack in a diagonal cell."
			puts "If you want to move type CAPITAL 'M', else type CAPITAL 'A'."
			input = gets.chomp
			if input == "M"
				White_Pawn.move_white_pawn(x, y, board)
			elsif input == "A"
				White_Pawn.attack(x, y, board)
			else
				puts "You gave the wrong input."
				Piece.move_piece(board)
			end
		end

		def move_white_pawn(x, y, board)
			if Piece.check_path(x, y, x, y - 1, board)
				board.set_cell(x, y - 1, :WP)
				board.set_cell(x, y, "")
			else
				puts "Try again"
				Piece.move_piece(board)
			end
		end

		def attack(x, y, board)
			cell_player = board.get_cell(x, y).player
			puts "Where do you want to attack, Right or Left? ('R'/'L')"
			direction = gets.chomp
			if direction == "R"
				if board.get_cell(x + 1, y - 1).player != cell_player
					board.set_cell(x + 1, y - 1, :WP)
					board.set_cell(x, y, "")
				else
					puts "You can't attack here!"
					Piece.move_piece(board)
				end
			elsif direction == "L"
				if board.get_cell(x - 1, y - 1).player != cell_player
					board.set_cell(x - 1, y - 1, :WP)
					board.set_cell(x, y, "")
				else
					puts "You can't attack here!"
					Piece.move_piece(board)
				end
			else
				puts "You did not give a valid direction"
				Piece.move_piece(board)
			end
					
		end

	end

	class Rook < Piece 

		def move(x, y, type, board) 
			puts "Type CAPITAL 'X' or 'Y' depending on the direction you want to move"
			direction = gets.chomp
			if direction = "X"
				puts "Give the new X coordinate"
				new_x = gets.chomp
				new_x = new_x.to_i
				if Piece.check_path(x, y, new_x, y, board)
					board.set_cell(new_x, y, type)
					board.set_cell(x, y, "")
				else
					puts "Try again"
					Piece.move_piece(board)
				end
			elsif direction = "Y"
				puts "Give the new Y coordinate"
				new_y = gets.chomp
				new_y = new_y.to_i
			  if Piece.check_path(x, y, x, new_y, board)
					board.set_cell(x, new_y, type)
					board.set_cell(x, y, "")
				else
					puts "Try again"
					Piece.move_piece(board)
				end
			else
				puts "You made a mistake declaring the direction, try again"
				Rook.move(x, y, type, board)
			end	
			
		end

	end

	class Bishop < Piece

		def move(x, y, type, board)
			puts "Type the X coordinate you want to move to"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Type the Y coordinate you want to move to and make sure it is in diagonal"
			new_y = gets.chomp
			new_y = new_y.to_i
			if Piece.check_path(x, y, new_x, new_y, board)
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "")
			else
				puts "Try again"
				Piece.move_piece(board)
			end
		end	

	end

	class Knight < Piece

		def move(x, y type, board)
			cell_player = board.get_cell(x, y).player
			possible_moves = []
			position = [x, y]
			possible_combinations = [[1, 2], [2, 1], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
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
				board.set_cell(x, y, "")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				Piece.move_piece(board)
			end
		end

	end

	class Queen < Piece

		def move(x, y, type, board)
			puts "You can move the Queen in straight or diagonal lines"
			puts "Give new X coordinate"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Give new Y coordinate"
			new_y = gets.chomp
			new_y = new_y.to_i
			if Piece.check_path(x, y, new_x, new_y, board)
				board.set_cell(new_x, new_y, type)
				board.set_cell(x, y, "")
			end
		end

	end

	class King < Piece

		def move(x, y, type, board)
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
				board.set_cell(x, y, "")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				Piece.move_piece(board)
			end
		end

	end

end