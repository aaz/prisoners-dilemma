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
    @config.each do |entry|
      classname = entry['class']
      player_name = entry['name']
      @players.push Object::const_get(classname).new player_name
    end
    @tournament = Tournament.new @players
  end
  
  def tournament
    @tournament
  end
end