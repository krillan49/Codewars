#===============================================================================================================
#                                               Description
#===============================================================================================================

# Same as the original (same rules, really, go there for example and I strongly recommend completing it first), but with more than one asterisk (but always at least one).
#
# For example, "*2" should return ["12", "42", "72"].
#
# Similarly, "*2*" should return ["024", "120", "126", "222", "228", "324", "420", "426", "522", "528", "624", "720", "726", "822", "828", "924"]. Order matters and returning the right one is part of the challenge itself, yep!
#
# More examples in the test codes and, of course, if you cannot generate any number divisible by 6, just return [] (or [] of String in Crystal).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def is_divisible_by_6(s)
  count, res = s.count('*'), []
  ('0' * count..'9' * count).each do |w|
    new = s
    w.chars{|c| new = new.sub(/[*]/, "#{c}")}
    res << new
  end
  res.select{|n| n.to_i % 6 == 0}
end
