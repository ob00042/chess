module Chess

	class Cell

		attr_accessor :value, :player

		def initialize(value = "")
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

		def cell_player
			if self.value == :WP || self.value == :WR || self.value == :WK || self.value == :WB || self.value == :WG || self.value == :WQ
				self.player = :player_white
			elsif self.value == :BP || self.value == :BR || self.value == :BK || self.value == :BB || self.value == :BG || self.value == :BQ
				self.player = :player_black
			else
				self.player = :empty
			end
		end

	end

end