#===============================================================================================================
#                                               Description
#===============================================================================================================

# When working with color values it can sometimes be useful to extract the individual red, green, and blue (RGB) component values for a color. Implement a function that meets these requirements:
#
# Accepts a case-insensitive hexadecimal color string as its parameter (ex. "#FF9933" or "#ff9933")
# Returns a Map<String, int> with the structure {r: 255, g: 153, b: 51} where r, g, and b range from 0 through 255
# Note: your implementation does not need to support the shorthand form of hexadecimal notation (ie "#FFF")
#
# Example
# "#FF9933" --> {r: 255, g: 153, b: 51}

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def hex_to_rgb(str)
  s = str[1..-1].chars.each_slice(2).map{|a| a.join.to_i(16)}
  {r: s[0], g: s[1], b: s[2]}
end
