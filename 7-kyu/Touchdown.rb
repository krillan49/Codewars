#===============================================================================================================
#                                               Description
#===============================================================================================================

# In American football, you get 4 chances (downs) at a time to get at least 10 yards down the field. If you succeed, you get four more downs, to try to get another 10 yards, and so on. Once you get 100 yards (the length of the field) you've made a touchdown!

# Complete the touchdown? method, which accepts an array of numbers that add up to 100. The numbers represent how many yards your team gained on each play. The method should return true if the plays would have resulted in a touchdown. Return false if your team would have run out of downs at any point before making the touchdown.

# Examples:

# yards = [90, 5.4, 4.6]
# touchdown?(yards)  #=> true
# In this case, your team never ran out of downs before getting 100 yards.

# yards = [20, 1, 2, 3, 3, 71]
# touchdown?(yards)  #=> false
# In this case, 20 yards was enough to earn 4 more downs. The next four tries, however, added up to only 9 yards, so they ran out of tries before that amazing last play would have happened.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def touchdown?(plays)
  return true if plays.size < 4
  distance = 0
  chances = 0
  plays.each do |n|
    distance += n
    chances += 1
    if distance >= 10
      distance = 0
      chances = 0
    end
    return false if distance < 10 and chances == 4
  end
  true
end
