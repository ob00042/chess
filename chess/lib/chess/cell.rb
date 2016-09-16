module Chess

	class Cell

		attr_accessor :value, :player

		def initialize(value = "  ")
			@value = value
			@player = :empty
		end

		#IRRELEVANT
		# def cell_color(color)
		# 	if color == :white || color == :black
		# 		@color = color
		# 	else
		# 		puts "Please enter a color either :white or :black"
		# 	end
		# end

		def cell_player(cell)
			if cell.value == :WP || cell.value == :WR || cell.value == :WK || cell.value == :WB || cell.value == :WG || cell.value == :WQ
				cell.player = :player_white
			elsif cell.value == :BP || cell.value == :BR || cell.value == :BK || cell.value == :BB || cell.value == :BG || cell.value == :BQ
				cell.player = :player_black
			else
				cell.player = :empty
			end
		end

	end

end