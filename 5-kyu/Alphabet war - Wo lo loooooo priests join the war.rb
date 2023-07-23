#===============================================================================================================
#                                               Description
#===============================================================================================================

# There is a war and nobody knows - the alphabet war!
# There are two groups of hostile letters. The tension between left side letters and right side letters was too high and the war began. The letters have discovered a new unit - a priest with Wo lo looooooo power.
#
#
# Task
# Write a function that accepts fight string consists of only small letters and return who wins the fight. When the left side wins return Left side wins!, when the right side wins return Right side wins!, in other case return Let's fight again!.
#
# The left side letters and their power:
#
#  w - 4
#  p - 3
#  b - 2
#  s - 1
#  t - 0 (but it's priest with Wo lo loooooooo power)
# The right side letters and their power:
#
#  m - 4
#  q - 3
#  d - 2
#  z - 1
#  j - 0 (but it's priest with Wo lo loooooooo power)
# The other letters don't have power and are only victims.
# The priest units t and j change the adjacent letters from hostile letters to friendly letters with the same power.
#
# mtq => wtp
# wjs => mjz
# A letter with adjacent letters j and t is not converted i.e.:
#
# tmj => tmj
# jzt => jzt
# The priests (j and t) do not convert the other priests ( jt => jt ).
#
# Example
# AlphabetWar("z")         //=>  "z"  => "Right side wins!"
# AlphabetWar("tz")        //=>  "ts" => "Left side wins!"
# AlphabetWar("jz")        //=>  "jz" => "Right side wins!"
# AlphabetWar("zt")        //=>  "st" => "Left side wins!"
# AlphabetWar("azt")       //=> "ast" => "Left side wins!"
# AlphabetWar("tzj")       //=> "tzj" => "Right side wins!"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

LE, RI = %w[s b p w], %w[z d q m] #t, j

def alphabet_war(fight)
  j = fight.size - 1
  fight.chars.each.with_index do |c, i|
    if c == 't'
      fight[i-1] = LE[RI.index(fight[i-1])] if i != 0 && RI.include?(fight[i-1]) unless i > 1 && fight[i-2] == 'j'
      fight[i+1] = LE[RI.index(fight[i+1])] if i != j && RI.include?(fight[i+1]) unless i < j-1 && fight[i+2] == 'j'
    elsif c == 'j'
      fight[i-1] = RI[LE.index(fight[i-1])] if i != 0 && LE.include?(fight[i-1]) unless i > 1 && fight[i-2] == 't'
      fight[i+1] = RI[LE.index(fight[i+1])] if i != j && LE.include?(fight[i+1]) unless i < j-1 && fight[i+2] == 't'
    end
  end
  l = fight.tr('^sbpw', '').chars.map{|e| LE.index(e) + 1} + [0]
  r = fight.tr('^zdqm', '').chars.map{|e| RI.index(e) + 1} + [0]
  l.sum > r.sum ? 'Left side wins!' : l.sum < r.sum ? 'Right side wins!' : "Let's fight again!"
end
