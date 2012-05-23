require 'yaml'
require 'defector'
require 'friedman'
require 'tit4tat'
require 'tit_for_two_tats'
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
        create_player(@players, entry)
      end
    end
    if iterations == nil then
      return Tournament.new @players
    else
      return Tournament.new(@players, iterations)
    end
  end
  
  def create_player(players, yaml_record)
    classname = yaml_record["class"]
    player_name = yaml_record["name"]
    n = 1
    copies = yaml_record["copies"]
    if (copies != nil) then
      n = copies.to_i
    end
    n.times {players.push Object::const_get(classname).new player_name}
  end
end