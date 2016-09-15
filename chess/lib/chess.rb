require_relative "./chess/version.rb"

module Chess
  # Your code goes here...
end

require_relative "./chess/cell.rb"
require_relative "./chess/board.rb"
require_relative "./chess/piece.rb"
require_relative "./chess/game.rb"
lib_path = File.expand_path(File.dirname(__FILE__))
Dir[lib_path + "/chess/**/*.rb"].each { |file| require file }
require_relative "../example/example.rb"