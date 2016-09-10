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
			if self.value == :WP1 || self.value == :WP2 || self.value == :WP3 || self.value == :WP4 || self.value == :WP5 || self.value == :WP6 || self.value == :WP7 || self.value == :WP8 || self.value == :WR1 || self.value == :WK1 || self.value == :WB1 || self.value == :WG || self.value == :WQ || self.value == :WB2 || self.value == :WK2 || self.value == :WR2
				self.player = :player_white
			elsif self.value == :BP1 || self.value == :BP2 || self.value == :BP3 || self.value == :BP4 || self.value == :BP5 || self.value == :BP6 || self.value == :BP7 || self.value == :BP8 || self.value == :BR1 || self.value == :BK1 || self.value == :BB1 || self.value == :BG || self.value == :BQ || self.value == :BB2 || self.value == :BK2 || self.value == :BR2
				self.player = :player_black
			else
				self.player = :empty
			end
		end

	end

end