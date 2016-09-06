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

		context "#cell_color" do
			it "has white color if :white is given" do
				allow(@cell.cell_color(:white))
				expect(@cell.color).to eq :white
			end

			it "has black color if :black is given" do
				allow(@cell.cell_color(:black))
				expect(@cell.color).to eq :black
			end

		end

	end


end