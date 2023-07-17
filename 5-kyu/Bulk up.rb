#===============================================================================================================
#                                               Description
#===============================================================================================================

# You've been going to the gym for some time now and recently you started taking care of your nutrition as well. You want to gain some weight but who wants to bother counting calories every day. It said somewhere that protein is the foundation of building muscle, so let's try to calculate the total amount of calories and proteins we take in.
#
# Task:
# Given an array of meals where each element is a string in the form '300g turkey, 300g potatoes, 100g cucumber' find out how many proteins and calories you consumed. You like to keep things simple so all values will be expressed in grams. In case you didn't know every gram of protein and carbohydrate has 4 calories, while 1 gram of fat provides 9 calories.
# An object food (in Ruby $food ) is preloaded for you that contains the information about the given food per 100 grams:
# $food = {
#   "chicken" => [20, 5, 10], # per 100g chicken has 20g of protein, 5 grams of carbohydrates and 10 grams of fat.
#   "eggs" => [10, 5, 15],    # protein:10g , carbs:5g , fats: 15g
#   "salmon" => [27, 0, 10],
#   "beans" => [8, 25, 0],
#   "bananas" => [1, 23, 0],
#   ...
#   ...
# }
# Round your results to 2 decimal places and return a string in the form "Total proteins: n grams, Total calories: n".
# Delete all trailing zeros on every float and remove trailing point if the result is an integer. Note: No invalid input testing.
#
# Have fun!
#                 _....----"""----...._
#              .-'  o    o    o    o   '-.
#             /  o    o    o         o    \
#            /     o      o   o     o    o \
#          _|   o   o    o      o  o     o  |_
#         / `''-----.................-----''` \
#         \___________________________________/
#           \~`-`.__.`-~`._.~`-`~.-~.__.~`-`/
#            \                             /
#             `-._______________________.-'
#
#             //lonely burger passing by

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bulk(f)
  return "Total proteins: 0 grams, Total calories: 0" if f == []
  sums = f.map{|s| s.split(', ')}.flatten.map(&:split)
  .map{|a| $food[a[1]].map{|e| e * (a[0][0..-2].to_f / 100)}}.transpose.map(&:sum)
  proteins = sums[0] % 1 == 0 ? sums[0].to_i : sums[0].round(2)
  calories = sums.map.with_index{|e, i| i == 2 ? e * 9 : e * 4}.sum.round(2)
  calories = calories.to_i if calories % 1 == 0
  "Total proteins: #{proteins} grams, Total calories: #{calories}"
end
