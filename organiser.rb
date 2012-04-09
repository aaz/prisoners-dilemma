require 'yaml'
require 'defector'
require 'tit4tat'
require 'random_player'
require 'tournament'
require 'round'

class Organiser
  def initialize
    @players = []
  end
  
  def read_config(yaml)
    @config = YAML.load(yaml)
    iterations = nil
    @config.each do |entry|
      if entry.has_key? "iterations" then
        iterations = entry["iterations"]
      elsif entry.has_key? "class" then
        classname = entry["class"]
        player_name = entry["name"]
        @players.push Object::const_get(classname).new player_name
      end
    end
    if iterations == nil then
      return Tournament.new @players
    else
      return Tournament.new(@players, iterations)
    end
  end
end