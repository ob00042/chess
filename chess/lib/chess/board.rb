module Chess

	class Board

		attr_reader :grid

		def initialize(input = {})
			@grid = input.fetch(:grid, default_grid)
		end

		def get_cell(x, y)
			grid[y][x]
		end

		def set_cell(x, y, value)
			get_cell(x, y).value = value
		end

		def formatted_grid
      grid.each do |row|
        puts row.map { |cell| cell.value }.join(" ")
      end
    end

		private

		def default_grid
			Array.new(8) { Array.new(8) { Cell.new } }
		end

	end

end