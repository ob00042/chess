require "spec_helper"
module Chess 

	describe Cell do 

		before :each do
			@cell = Cell.new
		end

		context "#initialize" do
			it "is initialized with a value of '' by default" do
				expect(@cell.value).to eq ""
			end
		end

		# IRRELEVANT!!!!
		# context "#cell_color" do
		# 	it "has white color if :white is given" do
		# 		allow(@cell.cell_color(:white))
		# 		expect(@cell.color).to eq :white
		# 	end

		# 	it "has black color if :black is given" do
		# 		allow(@cell.cell_color(:black))
		# 		expect(@cell.color).to eq :black
		# 	end

		# end

		context "#cell_player" do
			it "initiates empty player for empty cell" do
				expect(@cell.player).to eq :empty
			end

			it "gives player_white for White Pawn 1" do
				allow(@cell.value = :WP1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 2" do
				allow(@cell.value =:WP2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 3" do
				allow(@cell.value = :WP3)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 4" do
				allow(@cell.value = :WP4)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 5" do
				allow(@cell.value = :WP5)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 6" do
				allow(@cell.value = :WP6)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 7" do
				allow(@cell.value = :WP7)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Pawn 8" do
				allow(@cell.value = :WP8)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Rook 1" do
				allow(@cell.value = :WR1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Knight 1" do
				allow(@cell.value = :WK1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Bishop 1" do
				allow(@cell.value = :WB1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White King" do
				allow(@cell.value = :WG)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Queen" do
				allow(@cell.value = :WQ)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Bishop 2" do
				allow(@cell.value = :WB2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Knight 2" do
				allow(@cell.value = :WK2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Rook 2" do
				allow(@cell.value = :WR2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_black for Black Pawn 1" do
				allow(@cell.value = :BP1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 2" do
				allow(@cell.value =:BP2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 3" do
				allow(@cell.value = :BP3)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 4" do
				allow(@cell.value = :BP4)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 5" do
				allow(@cell.value = :BP5)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 6" do
				allow(@cell.value = :BP6)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 7" do
				allow(@cell.value = :BP7)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Pawn 8" do
				allow(@cell.value = :BP8)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Rook 1" do
				allow(@cell.value = :BR1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Knight 1" do
				allow(@cell.value = :BK1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Bishop 1" do
				allow(@cell.value = :BB1)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black King" do
				allow(@cell.value = :BG)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Queen" do
				allow(@cell.value = :BQ)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Bishop 2" do
				allow(@cell.value = :BB2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Knight 2" do
				allow(@cell.value = :BK2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Rook 2" do
				allow(@cell.value = :BR2)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives empty for an empty cell" do
				allow(@cell.cell_player)
				expect(@cell.player).to eq :empty
			end
		end

	end


end