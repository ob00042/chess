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
				@piece = Piece.new
				@piece.create_pieces
			end
			
			it "creates a white king, queen, bishop, knight, rook and pawn" do
				expect(@piece.white_king.name).to eq :WG
				expect(@piece.white_queen.name).to eq :WQ
				expect(@piece.white_bishop.name).to eq :WB
				expect(@piece.white_knight.name).to eq :WK
				expect(@piece.white_rook.name).to eq :WR
				expect(@piece.white_pawn.name).to eq :WP
			end

			it "creates a black king, queen, bishop, knight, rook and pawn" do
				expect(@piece.black_king.name).to eq :BG
				expect(@piece.black_queen.name).to eq :BQ
				expect(@piece.black_bishop.name).to eq :BB
				expect(@piece.black_knight.name).to eq :BK
				expect(@piece.black_rook.name).to eq :BR
				expect(@piece.black_pawn.name).to eq :BP
			end
		end

	end

end