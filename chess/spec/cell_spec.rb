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

			it "gives player_white for White Pawn" do
				allow(@cell.value = :WP)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			

			it "gives player_white for White Rook" do
				allow(@cell.value = :WR)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Knight" do
				allow(@cell.value = :WK)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_white
			end

			it "gives player_white for White Bishop" do
				allow(@cell.value = :WB)
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

			it "gives player_black for Black Pawn" do
				allow(@cell.value = :BP)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Rook" do
				allow(@cell.value = :BR)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Knight" do
				allow(@cell.value = :BK)
				allow(@cell.cell_player)
				expect(@cell.player).to eq :player_black
			end

			it "gives player_black for Black Bishop" do
				allow(@cell.value = :BB)
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
			
			it "gives empty for an empty cell" do
				allow(@cell.cell_player)
				expect(@cell.player).to eq :empty
			end
		end

	end


end