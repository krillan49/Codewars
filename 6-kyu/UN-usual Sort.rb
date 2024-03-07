#===============================================================================================================
#                                               Description
#===============================================================================================================

# In another Kata I came across a weird sort function to implement. We had to sort characters as usual ( 'A' before 'Z' and 'Z' before 'a' ) except that the numbers had to be sorted after the letters ( '0' after 'z') !!!
#
# (After a couple of hours trying to solve this unusual-sorting-kata I discovered final tests used **usual** sort (digits **before** letters :-)
#
# So, the unusualSort/unusual_sort function you'll have to code will sort letters as usual, but will put digits (or one-digit-long numbers ) after letters.
#
# Examples
# unusual_sort(["a","z","b"])  # -> ["a","b","z"]  as usual
# unusual_sort(["a","Z","B"])  # -> ["B","Z","a"]  as usual
#
# //... but ...
# unusual_sort(["1","z","a"])  # -> ["a","z","1"]
# unusual_sort(["1","Z","a"])  # -> ["Z","a","1"]
# unusual_sort([3,2,1"a","z","b"])  # -> ["a","b","z",1,2,3]
# unusual_sort([3,"2",1,"a","c","b"])  # -> ["a","b","c",1,"2",3]
# Note: digits will be sorted after "same-digit-numbers", eg: 1 is before "1", "2" after 2.
#
# unusual_sort([3,"2",1,"1","3",2])  # -> [1,"1",2,"2",3,"3"]
# You may assume that argument will always be an array/list of characters or one-digit-long numbers.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def unusual_sort(array)
  a = array.select{|e| /[a-z]/i === e}.sort
  b = array.select{|e| e.class == Integer || /[^a-z]/i === e}
           .map{|e| e.class == Integer ? e.to_s : e + '0'}.sort
           .map{|e| e.size > 1 ? e[0] : e.to_i}
  a + b
end
