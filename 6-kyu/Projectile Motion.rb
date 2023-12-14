#===============================================================================================================
#                                               Description
#===============================================================================================================

# You must create a class, Projectile, which takes in 3 arguments when initialized:
#
# starting height (0 ≤ h0 < 200)
# starting velocity (0 < v0 < 200)
# angle of the projectile when it is released (0° < a < 90°, measured in degrees).
# All units for distance are feet, and units for time are seconds.
#
# Note: Some solutions were invalidated because I added tests for situations where the starting height is 0, in which case the equation for height would be in the form h(t) = -16.0t^2 + vt where v represents the initial vertical velocity.
#
# h = −16 * t**2 + v * t + h0
# ​
# In the above equation, h represents the height of the projectile after t seconds; v represents the initial vertical velocity; and h0 represents the starting height.
#
# You need to write the following methods for the Projectile class. In Crystal, the arguments passed when the object is initialized will always be of the type Float64, and in Java/Scala/Kotlin/Dart/C#, they will be int/Ints.
#
# A height_eq, heightEq, or HeightEq method, which returns the equation for height of the projectile as a function of time. [takes in nothing, returns a String]
# A horiz_eq, horizEq, or HeightEq method, which returns the equation for the horizontal position of the projectile as a function of time. [takes in nothing, returns a String]
# A height or Height method, which takes in an argument t and calculates the height of the projectile in feet. [takes in a double, returns a double]
# A horiz or Horiz method, which also takes in an argument t and calculates the horizontal distance that the projectile has traveled. [takes in a double, returns a double]
# A landing or Landing method which returns the point at which the projectile lands on the ground, in the form [x, y, t]. (y should always be 0). [takes in nothing, returns an array of doubles]
# EVERYTHING, including values in the equations appearing as coefficients, must be rounded to THREE decimal places. However, if the value is whole, only show one decimal place (for example => -16 becomes -16.0, not -16.000). But ensure that you DO NOT use the three-decimal-place rounded values for calculations. Otherwise, you will find yourself getting answers CLOSE to the correct one but slightly off.
#
# You also need to define instance variables as needed. These will not be tested.
#
# Examples
# Projectile Motion ExampleThis example shows the initial vertical and horizontal velocity when a projectile is fired at 2 ft/s.
#
# p = Projectile.new(5, 2, 45) #=> a projectile starting at 5 ft above the ground, traveling initially at 2 ft/s, and at an angle of 45 degrees with the horizontal (shown in the triangle above)
# p.height_eq #=> "h(t) = -16.0t^2 + 1.414t + 5.0"
#   # 1.414 = 2sin(45°)
# p.horiz_eq #=> "x(t) = 1.414t"
#   # 1.414 = 2cos(45°)
# p.height(0.2) #=> 4.643 (Calculation: -16(0.2)^2 + (2sin(45°))(0.2) + 5)
# p.horiz(0.2) #=> 0.283 (Calculation: 2cos(45°) * 0.2)
# p.landing() #=> [0.856, 0, 0.605] (After 0.605 seconds (t = 0.605), the particle has landed on the ground (y = 0), and is 0.856 ft horizontally (x = 0.856) away from the release point.)
# Additionally, note that all coefficients are to be expressed as floats in the string equations, regardless of whether or not they are whole. This means that whole numbers should always be formatted with a ".0" appended.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Projectile
  def initialize(h0,v0,alfa)
    @h0, @v0, @alfa = h0, v0, alfa/180.0*Math::PI
  end
  def height_eq
    "h(t) = -16.0t^2 + #{(@v0 * Math.sin(@alfa)).round(3)}t" + (@h0 == 0 ? '' : " + #{(@h0.to_f).round(3)}")
  end
  def horiz_eq
    "x(t) = #{(@v0 * Math.cos(@alfa)).round(3)}t"
  end
  def height(t)
    h = (-16.0 * t**2 + @v0 * Math.sin(@alfa) * t + @h0).round(3)
  end
  def horiz(t)
    x = (@v0 * Math.cos(@alfa) * t).round(3)
  end
  def landing
    t = (-@v0 * Math.sin(@alfa) - Math.sqrt((@v0 * Math.sin(@alfa))**2 + 64 * @h0)) / -32.0
    x = @v0*Math.cos(@alfa) * t
    [x.round(3), 0, t.round(3)]
  end
end
