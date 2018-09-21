require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width, @height = width, height
    @matrix = Array.new(width) {Array.new(height)}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    @matrix[x][y] = pixel
  end

  def at(x, y)
    inbounds(x,y)
  end

private
  def inbounds(x, y)
    return nil if x < 0 || y < 0 || x > @width || y > @height
    @matrix[x][y]
  end
  
end
