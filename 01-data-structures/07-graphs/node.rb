require "set"

class Node
  attr_accessor :name, :adjacents, :film_actor_hash

  def initialize(name)
    @adjacents = Set.new
    @name = name
		@film_actor_hash = Hash.new()
  end

  def to_s
    @name
  end
end