#===============================================================================================================
#                                               Description
#===============================================================================================================

# Started in 2008 and recently resurging in popularity, a game known as Number Neighbour or Text Door Neighbor has people sending a text message to phone numbers near their own. Traditionally this was done for numbers ±1, so someone with the phone number 555-555-5555 has neighbors 555-555-5554 and 555-555-5556.
#
# We're going to take this a step further and think about neighbors based on a classic phone keypad.
#
# First, let's take a look at the classic phone keypad:
#
# 1 2 3
# 4 5 6
# 7 8 9
#   0
# We can consider certain numbers adjacent if they appear directly next to or above/below each other. For example, 1 is adjacent to 2 and 4 (and nothing else), while 5 is adjacent to 2, 4, 6, and 8.
#
# Let's look for phone numbers that are "neighbors" of a given phone number by having any one (and only one) of their digits be off-by-one as a number adjacent to the original.
#
# By this definition, 555-555-5555 has both its original neighbors but also, e.g., 554-555-5555 and 555-555-5558.
#
# Problem
# Given a phone number of integer length N (1 ≤ N ≤ 10) as a number string (e.g. 555-555-5555 would be passed as "5555555555"), return an array of all phone numbers as number strings that would be considered neighbors of that phone number.
#
# Examples
# Given:
#
#   "1"
#
# Return:
#
#   ["2", "4"]
# Given:
#
#   "8675309"
#
# Return:
#
#   ["5675309", "7675309", "9675309", "0675309", "8375309", "8575309", "8975309",
#    "8645309", "8685309", "8672309", "8674309", "8676309", "8678309", "8675209",
#    "8675609", "8675389", "8675306", "8675308"]
# Notes
# Do not wrap around a side of the keypad when finding adjacent numbers. That is, do not consider 6 adjacent to 4 nor 0 adjacent to 2.
# Do not consider numbers that are diagonal to each other adjacent
# Do not worry about invalid characters, nil, or anything other than a valid number string being passed in
# Do not worry about the order of number strings in the array being returned

#===============================================================================================================
#                                               Solution
#===============================================================================================================

NUMS = {
  '0'=>%w[8],
  '1'=>%w[2 4], '2'=>%w[1 3 5], '3'=>%w[2 6],
  '4'=>%w[1 5 7], '5'=>%w[2 4 6 8], '6'=>%w[3 5 9],
  '7'=>%w[4 8],'8'=>%w[5 7 9 0],'9'=>%w[6 8]
}

def neighbors_of(pn)
  res = []
  pn.chars.each.with_index do |e, i|
    NUMS[e].each do |n|
      res << pn[0...i] + n + pn[i+1..-1]
    end
  end
  res
end
