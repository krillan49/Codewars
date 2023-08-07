#===============================================================================================================
#                                               Description
#===============================================================================================================

# John and his wife Ann have decided to go to Codewars. On the first day Ann will do one kata and John - he wants to know how it is working - 0 kata.
#
# Let us call a(n) - and j(n) - the number of katas done by Ann - and John - at day n. We have a(0) = 1 and in the same manner j(0) = 0.
#
# They have chosen the following rules:
#
# On day n the number of katas done by Ann should be n minus the number of katas done by John at day t, t being equal to the number of katas done by Ann herself at day n - 1
#
# On day n the number of katas done by John should be n minus the number of katas done by Ann at day t, t being equal to the number of katas done by John himself at day n - 1
#
# Whoops! I think they need to lay out a little clearer exactly what there're getting themselves into!
#
# Could you write:
# functions ann(n) and john(n) that return the list of the number of katas Ann/John does on the first n days;
# functions sum_ann(n) and sum_john(n) that return the total number of katas done by Ann/John on the first n days
# Examples:
# john(11)  -->  [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]
# ann(6)    -->  [1, 1, 2, 2, 3, 3]
#
# sum_john(75)  -->  1720
# sum_ann(150)  -->  6930
# Note:
# Keep an eye on performance.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

$a_john, $a_ann = [0], [1]

def j_a_counter(n)
  return [$a_john[0..n-1], $a_ann[0..n-1]] if $a_john.size >= n-1
  ($a_john.size..n-1).each do |i|
    $a_john << i - $a_ann[$a_john[i-1]]
    $a_ann << i - $a_john[$a_ann[i-1]]
  end
  [$a_john, $a_ann]
end
def john(n) j_a_counter(n)[0] end
def ann(n) j_a_counter(n)[1] end
def sum_john(n) j_a_counter(n)[0].sum end
def sum_ann(n) j_a_counter(n)[1].sum end
