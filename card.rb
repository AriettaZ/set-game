class Card
  def initialize(color, shading, shape,number)
      @color = color
      @shading = shading
      @symbol = shape
      @number = number
  end
  attr_reader :color
  attr_reader :shading
  attr_reader :symbol
  attr_reader :number
end
