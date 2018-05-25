#Author: Arial, Gail
#Create Date: 5/22
#Edit: Mike 5/23 move global variables from main.rb to card.rb

$Colors=['red','purple','green']
$Shadings=['striped','solid','open']
$Symbols=['diamond','squiggle','oval']
$Numbers=['1','2','3']

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
  
  def [] (attribute)
    attribute = attribute.downcase.intern if attribute.is_a?(String)
    return @color if attribute==:color
    return @shading if attribute==:shading
    return @symbol if attribute==:symbol
    return @number if attribute==:number
  end
  
end
