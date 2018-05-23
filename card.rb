
class Card
  # initialize Card class
  def initialize(color, shading, shape, number)
      @color = color
      @shading = shading
      @symbol = shape
      @number = number
  end
  # get instance variables
  attr_reader :color
  attr_reader :shading
  attr_reader :symbol
  attr_reader :number
end
