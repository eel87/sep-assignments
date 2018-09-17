class Pixel
  attr_accessor :red
  attr_accessor :green
  attr_accessor :blue
  attr_accessor :x
  attr_accessor :y

  def initialize(red, green, blue, x, y)
    @x, @y = x, y
    @red = validate_color(red)
    @green = validate_color(green)
    @blue = validate_color(blue)
  end

  private
  def validate_color(color)
    if color < 0
      color = 0
    elsif  color > 255
      color = 255
    else
      color = color
    end
  end

end
