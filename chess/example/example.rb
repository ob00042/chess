#root = File.expand_path("../", File.dirname(__FILE__))
require_relative "../lib/chess.rb"

puts "Welcome to Chess"
Chess::Game.new.play