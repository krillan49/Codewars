#===============================================================================================================
#                                               Description
#===============================================================================================================

# Given a string dot notation, you should return a chained hash object, in the same order of this string:
#
# Example:
#
# transforms("kata.dot.notation", "final value")
# Produces
#
# {kata: {dot: {notation: "final value"}}}

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def transform(notation, final_value)
  hh = {}
  notation.split('.').reverse.each_with_index do |e, i|
    if i == 0
      hh[e.to_sym] = final_value
    else
      result = hh
      hh = {}
      hh[e.to_sym] = result
    end
  end
  hh
end
