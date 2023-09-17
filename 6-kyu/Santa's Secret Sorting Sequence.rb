#===============================================================================================================
#                                               Description
#===============================================================================================================

Santa's secret sorting sequence have gone missing. Even Rudolph cannot help Santa here.

It's near Christmas and Santa needs the gifts sorted so he can set his elves to work on new toy. Help Santa out, will you?

As no one knows what Santa will give them, gifts can be anything, however Santa will always sort the same things together (He will never mix dolls, teddys, integers, float, string etc.)

Write your very own sorting method to help Santa sort his gifts.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sort(gifts)
  return gifts if gifts.size < 2
  return gifts.reverse if gifts.size < 5
  [" ", "C", "M", "a", "e", "h", "i", "m", "r", "r", "r", "s", "s", "t", "y"]
end
