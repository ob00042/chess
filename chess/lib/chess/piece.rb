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

		def move_piece
			puts "Give the X coordinate of the piece you want to move"
			x = gets.chomp
			x = x.to_i
			puts "Give the Y coordinate of the piece you want to move"
			y = gets.chomp
			y = y.to_i
			piece_name = Board.get_cell(x, y).vallue
			case piece_name
			when "" then puts "This is an empty cell"
			when :WP then White_Pawn.move(x, y)
			when :WR then Rook.move(x, y, :WR)
			when :BR then Rook.move(x, y, :BR)
			when :WB then Bishop.move(x, y, :WB)
			when :BB then Bishop.move(x, y, :BB)
			when :WK then Knight.move(x, y, :WK)
			when :BK then Knight.move(x, y, :BK)
			when :WQ then Queen.move(x, y, :WQ)
			when :BQ then Queen.move(x, y, :BQ)
			when :WG then King.move(x, y, :WG)
			when :BG then King.move(x, y, :BG)
		end

		def check_path(x, y, xx, yy) # can refactor the last bit about checking if the player is the same in the begining, not in the end of each case!!!!

			cell_player = Board.get_cell(x, y).player

			if xx >= x && yy >= y # both new coordinates are larger than older ones
				if x == xx && y != yy # x is the same, y changes
					z = y+1
					while z < yy
						if Board.get_cell(x, z).value != ""
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if Board.get_cell(x, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end 
				elsif y == yy && x != xx # y is the same, x changes
					z = x + 1
					while x < xx
						if Board.get_cell(z, y).value != ""
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if Board.get_cell(xx, y).player == cell_player
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
							if Board.get_cell(z, m).value != ""
								puts "You can't move there"
								return false
							end
							z += 1
							m += 1
						end
						if Board.get_cell(xx, yy).player == cell_player
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
						if Board.get_cell(x, z).value != ""
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if Board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y satys the same, x changes
					z = x - 1
					while z > xx
						if Board.get_cell(z, y).value != ""
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if Board.get_cell(xx, yy).player == cell_player
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
							if Board.get_cell(z, m).value != ""
								puts "You can't move there"
								return false
							end
							z -= 1
							m -= 1
						end
						if Board.get_cell(xx, yy).player == cell_player
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
						if Board.get_cell(x, z).value != ""
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if Board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y is the same and x is bigger
					z = x + 1
					while z < xx
						if Board.get_cell(z, y).value != ""
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if Board.get_cell(xx, yy).player == cell_player
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
							if Board.get_cell(z, m).value != ""
								puts "You can't move there"
								return false
							end
							z += 1
							m -= 1
						end
						if Board.get_cell(xx, yy).player == cell_player
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
						if Board.get_cell(x, z).value != ""
							puts "You can't move there"
							return false
						end
						z += 1
					end
					if Board.get_cell(xx, yy).player == cell_player
						puts "You can't move there"
						return false
					else
						return true
					end
				elsif y == yy && x != xx # y is the same and x is smaller
					z = x - 1
					while z > xx
						if Board.get_cell(z, y).value != ""
							puts "You can't move there"
							return false
						end
						z -= 1
					end
					if Board.get_cell(xx, yy).player == cell_player
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
							if Board.get_cell(z, m).value != ""
								puts "You can't move there"
								return false
							end
							z -= 1
							m += 1
						end
						if Board.get_cell(xx, yy).player == cell_player
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

	class White_Pawn < Piece # NEED TO ADD ATTACK!!!!!

		def move(x, y)
			if Piece.check_path(x, y, x+1, y)
				Board.set_cell(x+1, y, :WP)
				Board.set_cell(x, y, "")
			else
				puts "Try again"
				Piece.move_piece
			end
		end

	end

	class Rook < Piece 

		def move(x, y, type) 
			puts "Type CAPITAL 'X' or 'Y' depending on the direction you want to move"
			direction = gets.chomp
			if direction = "X"
				puts "Give the new X coordinate"
				new_x = gets.chomp
				new_x = new_x.to_i
				if Piece.check_path(x, y, new_x, y)
					Board.set_cell(new_x, y, type)
					Board.set_cell(x, y, "")
				else
					puts "Try again"
					Piece.move_piece
				end
			elsif direction = "Y"
				puts "Give the new Y coordinate"
				new_y = gets.chomp
				new_y = new_y.to_i
			  if Piece.check_path(x, y, x, new_y)
					Board.set_cell(x, new_y, type)
					Board.set_cell(x, y, "")
				else
					puts "Try again"
					Piece.move_piece
				end
			else
				puts "You made a mistake declaring the direction, try again"
				Rook.move(x, y, type)
			end	
			
		end

	end

	class Bishop < Piece

		def move(x, y, type)
			puts "Type the X coordinate you want to move to"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Type the Y coordinate you want to move to and make sure it is in diagonal"
			new_y = gets.chomp
			new_y = new_y.to_i
			if Piece.check_path(x, y, new_x, new_y)
				Board.set_cell(new_x, new_y, type)
				Board.set_cell(x, y, "")
			else
				puts "Try again"
				Piece.move_piece
			end
		end	

	end

	class Knight < Piece

		def move(x, y type)
			cell_player = Board.get_cell(x, y).player
			possible_moves = []
			position = [x, y]
			possible_combinations = [[1, 2], [2, 1], [-1, 2], [-2, 1], [-2, -1], [-1, -2], [1, -2], [2, -1]]
			possible_combinations.each do |combination|
				new_x = combination[0] + x
				new_y = combination[1] + y
				if new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7 && Board.get_cell(new_x, new_y).player != cell_player
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
				Board.set_cell(new_x, new_y, type)
				Board.set_cell(x, y, "")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				Piece.move_piece
			end
		end

	end

	class Queen < Piece

		def move(x, y, type)
			puts "You can move the Queen in straight or diagonal lines"
			puts "Give new X coordinate"
			new_x = gets.chomp
			new_x = new_x.to_i
			puts "Give new Y coordinate"
			new_y = gets.chomp
			new_y = new_y.to_i
			if Piece.check_path(x, y, new_x, new_y)
				Board.set_cell(new_x, new_y, type)
				Board.set_cell(x, y, "")
			end
		end

	end

	class King < Piece

		def move(x, y, type)
			puts "Careful when you move the King!"
			cell_player = Board.get_cell(x, y).player
			possible_moves = []
			possible_combinations = [[-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0]]
			possible_combinations.each do |combination|
				new_x = combination[0] + x
				new_y = combination[1] + y
				if new_x >= 0 && new_x <= 7 && new_y >= 0 && new_y <= 7 && Board.get_cell(new_x, new_y).player != cell_player
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
				Board.set_cell(new_x, new_y, type)
				Board.set_cell(x, y, "")
			else
				puts "You did not chose one of the possibble combinations, try again: "
				Piece.move_piece
			end
		end

	end

end