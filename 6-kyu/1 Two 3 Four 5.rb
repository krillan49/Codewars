#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given num (up to 15 digits, never less than 0).
#
# If the length of num is even, return odd numbers as ints and even ones as strings, based on their position in the given number. Strings alternate in type cases: starting in lowercase to uppercase and so on based on position. If the length of num is odd, all the rules are opposite. See sample tests.
#
# Note: Positions of numbers are 1-based.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

N = { 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five', 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine', 0=>'zero' }

def helper(d, i, oe)
  ([N[d]] * ((i + 1) / (N[d].size - 2))).map.with_index{|w, j| j.send(oe) ? w : w.upcase}.join[0..i]
end

def conv(num)
  if num.to_s.size.even?
    num.digits.reverse.map.with_index do |d, i|
      d.odd? ? d : N[d].size >= i + 1 ? N[d][0..i] : helper(d, i, :even?)
    end
  else
    num.digits.reverse.map.with_index do |d, i|
      d.even? ? d : N[d].size >= i + 1 ? N[d][0..i].upcase : helper(d, i, :odd?)
    end
  end
  .join
end
