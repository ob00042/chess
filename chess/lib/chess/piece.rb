module Chess

	class Piece

		attr_reader :color, :name, :white_king, :white_queen, :white_bishop, :white_knight, :white_rook, :white_pawn

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

		def place_in_board

		end


	end

end