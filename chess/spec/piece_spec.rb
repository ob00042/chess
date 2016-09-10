require "spec_helper"

module Chess

	describe Piece do 

		context "#initialize" do
			it "initializes a piece with color :white and name :WP1" do
				piece = Piece.new(:white, :WP1)
				expect(piece.color).to eq :white
				expect(piece.name).to eq :WP1
			end
		end

		context "#create_pieces" do
			before :all do
				piece = Piece.new
				@piece.create_pieces
			end
			
			it "creates a white king, queen, bishop, knight, rook and pawn" do
				expect(@white_king.name).to eq :WG
				expect(@white_queen.name).to eq :WQ
				expect(@white_bishop.name).to eq :WB
				expect(@white_knight.name).to eq :WK
				expect(@white_rook.name).to eq :WR
				expect(@white_pawn.name).to eq :WP
			end
		end

	end

end