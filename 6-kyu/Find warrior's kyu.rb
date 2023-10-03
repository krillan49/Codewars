#===============================================================================================================
#                                               Description
#===============================================================================================================

# You will be given an array and a single item from that array. The smallest value in array has the highest kyu - 1st kyu, 2nd smallest - 2nd kyu and so on. There are 8 kyus and each one has limited spots:
#
#  1st kyu - 1 slot
#  2nd kyu - 2 slots
#  3rd kyu - 2 slots
#  4th kyu - 3 slots
#  5th kyu - 3 slots
#  6th kyu - 3 slots
#  7th kyu - 4 slots
#  8th kyu - 4 slots
# You should return kyu for the value passed based on the array. If value isn't low enough to get a kyu then return 0.
#
# Examples:
#
# ([66,12,90,15], 15) => 2
# ([1,7,2,3,4,5], 1) => 1
# ([1,7,2,3,4,5,9,10], 7) => 4

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def get_kyu(all_honors, honor)
  i = all_honors.sort.index(honor)
  case i
  when 0; 1
  when (1..2); 2
  when (3..4); 3
  when (5..7); 4
  when (8..10); 5
  when (11..13); 6
  when (14..17); 7
  when (18..21); 8
  else; 0
  end
end
