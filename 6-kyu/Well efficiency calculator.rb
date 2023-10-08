#===============================================================================================================
#                                               Description
#===============================================================================================================

# In this kata you have a 20x20 preloaded array of oil saturation in some region. Your task is to answer whether it is efficient to place the well at the given point. A well is efficient if its efficiency is bigger or equal to given threshold.
#
# Input parameters in that function are:
#
# x and y integer coordinates of the well (indexes of 2D array);
# efficiency threshold (float or integer).
# Example of oil field:
#
# FIELD = [['0.98', '0.65', '0.23', '0.39', '0.99', ...], [...] ...]
# Examples of usage:
#
# is_efficient(10, 10, 3.5) = true
# is_efficient(7, 3, 4.5) = false
# To calculate the current efficiency of a well, you should sum up all saturations of cells adjacent to the specified cell plus the saturation of the specified cell itself.
#
# https://hostingkartinok.com/show-image.php?id=4d035268b3b0efa8eb048637f27f00dd
#
# The efficiency of the marked point with 0.43 is 5.3 (sum of all cells in rectangle).
#
# If you need to calculate the efficiency at the edge of the field, you should just take in account only cells in the field.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def is_efficient(x, y, threshold)
  res = 0
  ((x > 0 ? x - 1 : x)..(x < 19 ? x + 1 : x)).each do |j|
    ((y > 0 ? y - 1 : y)..(y < 19 ? y + 1 : y)).each do |i|
      res += FIELD[j][i].to_f
    end
  end
  res >= threshold
end
