#===============================================================================================================
#                                               Description
#===============================================================================================================

# I was recently killing time on Reddit when I stumbled across this image:
#
#
# on r/programmerhumor.
#
# So for this kata, let us all be person number 1 in that image.
#
# Write the function functionator(str) that given a string str will enable us to create this desired style of code writing.
#
# For example:
#
# obj = functionator("there are two kinds of people")
# obj["there"]["are"]["two"]["kinds"]["of"]["people"] == true
# Please note that these chainable calls do not return the current object i.e.
#
# obj = functionator("there are two kinds of people")
# obj["there"]["are"] #or
# obj["there"]["are"]["two"]["kinds"] #is NOT valid

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def functionator(string)
  hh1, hh2 = {}, {}
  string.split.reverse.each_with_index{|w, i| i == 0 ? hh1[w] = true : i.odd? ? (hh2[w], hh1 = hh1, {}) : (hh1[w], hh2 = hh2, {}) }
  hh1.empty? ? hh2 : hh1
end
