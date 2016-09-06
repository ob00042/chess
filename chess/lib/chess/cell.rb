module Chess

	class Cell

		attr_accessor :value, :color

		def initialize(value = "")
			@value = value
		end

		def cell_color(color)
			if color == :white || color == :black
				@color = color
			else
				puts "Please enter a color either :white or :black"
			end
		end

	end

end