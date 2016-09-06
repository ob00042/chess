require "spec_helper"

module Chess

	describe Board do 

		context "#initialize" do

			it "initializes the board with a grid" do
				expect{ Board.new(grid: "grid") }.to_not raise_error
			end

			it "creates a grid with 8 rows" do
				board = Board.new
				expect(board.grid.size).to eq 8
			end

			it "creates eight things in each row" do
				board = Board.new
				board.grid.each do |row|
					expect(row.size).to eq 8
				end
			end

			it "creates a grid with Cell objects" do
				board = Board.new
				board.grid.each do |row|
					row.each do |obj|
						expect(obj).to be_kind_of(Cell)
					end 
				end
			end
		end

		context "#get_cell" do
			it "returns the cell based on (x,y) coordinates" do
				grid = [["","","","","","","",""], ["","","something","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""]]
				board = Board.new(grid: grid)
				expect(board.get_cell(2, 1)).to eq "something"
			end
		end

		context "#set_cell" do
			it "updates the value of the cell object at a (x,y) coordinate" do
				Cat = Struct.new(:value)
				grid = [[Cat.new("cool"),"","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""], ["","","","","","","",""]]
				board = Board.new(grid: grid)
				board.set_cell(0, 0, "meow")
				expect(board.get_cell(0,0).value).to eq "meow"
			end
		end

	end

end