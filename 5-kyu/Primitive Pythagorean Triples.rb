#===============================================================================================================
#                                               Description
#===============================================================================================================

# Pythagoras(569-500 B.C.E.) discovered the relation a² + b² = c² for rectangle triangles,a, b and c are the side values of these special triangles. A rectangle triangle has an angle of 90°. In the following animated image you can see a rectangle triangle with the side values of (a, b, c) = (3, 4, 5) The pink square has an area equals to 9 (a² = 3²), the green square an area equals to 16 (b² = 4²) and the square with pink and green an area of 25 (c² = 5²) Adding the pink area to the green one, we obtain 9 + 16 = 25
#
# https://imgur.com/d0minUx
#
# A Pythagorean Triple (a, b, c) is such that a ≤ b < c, the three are integers, and a² + b² = c².
#
# A Primitive Pythagorean Triple has another additional property: a, b and c are co-primes. Two numbers are co-primes when the Greatest Common Divisor of every pair of the triple is 1. So G.C.D.(a, b) = 1, G.C.D.(b, c) = 1 and G.C.D.(a, c) = 1
#
# Just to visualize the primitives triples, we may see them, each one represented like a rectangle triangle displayed in a 2D arrengement done by Adam Cunningham and John Ringland (March 2012):
#
# https://imgur.com/1E5w7g3
#
# The perimeter for a pythagorean triple is: per = a + b + c
#
# The first 16 primitive pythagorean triples with their corresponding perimeter beside, having c below or equal 100 (c ≤ 100) are:
#
#  (3, 4, 5),   12        (5, 12, 13),  30          (8, 15, 17),  40        (7, 24, 25),  56
# (20, 21, 29), 70        (12, 35, 37), 84          (9, 40, 41),  90        (28, 45, 53), 126
# (11, 60, 61), 132       (16, 63, 65), 144         (33, 56, 65), 154       (48, 55, 73), 176
# (13, 84, 85), 182       (36, 77, 85), 198         (39, 80, 89), 208       (65, 72, 97), 234
# The primitive triple that has the maximum perimeter, with c ≤ 100 is (65, 72, 97) with a perimeter equals to 234
#
# Your task is to make a function that receives an argument returns the triple with the maximum perimeter having the side c below or equal its argument.
#
# The function will output a list of dictionaries as follows:
#
# [{"number triplets below-eq c_max": amount_triplets}, {"max perimeter": max_per}, {"largest triplet": (am, bm, cm)}]
#
# Let's see some cases:
#
#
# find_max_triple(50) == [{'number triples below-eq 50': 7}, {'max perimeter': 90}, {'largest triplet': [(9, 40, 41)]}]
#
# find_max_triple(100) == [{'number triples below-eq 100': 16}, {'max perimeter': 234}, {'largest triplet': [(65, 72, 97)]}]
#
# find_max_triple(150) = [{'number triples below-eq 150': 24}, {'max perimeter': 340}, {'largest triplet': [(51, 140, 149)]}]
# The function will output a tuple / array (depending on the language; refer to solution set up for the exact format) of 3 elements in order: the number of triples below the argument, the maximum perimeter of those triples, and an array / tuple with the largest triple.
#
# Examples (input --> output)
# 50 --> (7, 90, (9, 40, 41))
#
# 100 --> (16, 234, (65, 72, 97))
#
# 150 --> (24, 340, (51, 140, 149))
#
# Hint, see at: https://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples
#
# Your code will be tested for values of c_max up to 10000.
#
# (Memoizations is advisable)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def all_squared_pairs(num)
  (1..((num/2)**0.5).floor).each.with_object([]) do |n, res|
    r = ((num - n**2)**0.5).round(6)
    res << [r.to_i, n].sort if r % 1 == 0
  end
end

$pyth = []
(5..5000).each do |c|
  res = all_squared_pairs(c**2)
  if res != []
    res.select!{|a, b| [a.gcd(b), a.gcd(c), b.gcd(c)].max == 1}
    res.each{|arr| $pyth << (arr << c) } if res
  end
end

def find_max_triple(c_max)
  res = $pyth.select{|a| a[2]<=c_max}
  max = res.max_by{|a| a.sum}
  [{"number triples below-eq #{c_max}"=>res.size}, {'max perimeter'=>max.sum}, {'largest triple'=>max}]
end
