require "spec_helper"

module Chess

	describe Board do 

		before :each do
			@board = Board.new
		end

		context "#initialize" do

			it "creates an 8x8 array" do
				expect(@board.row).to eq 8
				expect(@board.column).to eq 8
			end

		end

	end

end