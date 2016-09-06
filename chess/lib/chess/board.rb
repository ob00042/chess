module Chess

	class Board

		attr_accessor :board
		
		def initialize
			board = Array.new(8){ Array.new(8) { Cell.new } }
		end


	end




end