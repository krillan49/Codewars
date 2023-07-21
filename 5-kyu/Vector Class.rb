#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a class Vector that has simple (3D) vector operators.
#
# In your class, you should support the following operations, given Vector a and Vector b:
#
# a + b # returns a new Vector that is the resultant of adding them
# a - b # same, but with subtraction
# a == b # returns true if they have the same magnitude and direction
# a.cross(b) # returns a new Vector that is the cross product of a and b
# a.dot(b) # returns a number that is the dot product of a and b
# a.to_a # returns an array representation of the vector.
# a.to_s # returns a string representation of the vector in the form "<a, b, c>"
# a.magnitude # returns a number that is the magnitude (geometric length) of vector a.
# a.x # gets x component
# a.y # gets y component
# a.z # gets z component
# Vector.new([a,b,c]) # creates a new Vector from the supplied 3D array.
# Vector.new(a,b,c) # same as above
# The test cases will not mutate the produced Vector objects, so don't worry about that.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Vector
  attr_reader :x,:y,:z
  def initialize(*args)
    @x, @y, @z = args.flatten
  end
  def to_a
    [@x, @y, @z]
  end
  def to_s
    "<#{@x}, #{@y}, #{@z}>"
  end
  def magnitude
    (@x**2 + @y**2 + @z**2)**0.5
  end
  def ==(obj)
    self.magnitude == obj.magnitude && [@x,@y,@z].zip([obj.x, obj.y, obj.z]).all?{|a, b| (a<0 && b<0) or (a>0 && b>0) or a == b}
  end
  def +(obj)
    Vector.new(@x + obj.x, @y + obj.y, @z + obj.z)
  end
  def -(obj)
    Vector.new(@x - obj.x, @y - obj.y, @z - obj.z)
  end
  def dot(obj)
    @x * obj.x + @y * obj.y + @z * obj.z
  end
  def cross(obj)
    Vector.new(@y * obj.z - @z * obj.y, @z * obj.x - @x * obj.z, @x * obj.y - @y * obj.x)
  end
end
