#===============================================================================================================
#                                               Description
#===============================================================================================================

# The year is 2070 and intelligent connected machines have replaced humans in most things. There are still a few critical jobs for mankind including machine software developer, for writing and maintaining the AI software, and machine forward deployed engineer for controlling the intelligent machines in the field. Lorimar is a forward deployed machine engineer and at any given time he controls thousands of BOT robots through real time interfaces and intelligent automation software.
#
# While Lorimar remains highly skilled in the art of computer programming the people in general have fallen away from their technical roots. Much of the innovation leading to the development of the machines was done by the early pioneers. Today the people are relying on past success to prop up their machine dependant society. There are bugs, flaws, vulnerabilities and BOT robots in need of update, patching and maintenance. In some cases the BOT is isolated and siloed with no human interaction. When this happens it must be located and disabled. Lorimar is on the hunt and tracking an infected non-responsive and dangerous BOT originally commissioned for automated security services in highly hostile urban battlefield settings. This particular BOT is very unpredictable as its operating environment is not understood by modern developers who have become reliant on extreme abstraction without fully understanding the inner workings of the system.
#
# Your task is to search through a string of integers related to BOT system internals found during a recent scan of communication systems searching for a pattern.
#
# 100 ≤ log ≤ 100000
# 1 ≤ n ≤ 10000
#
# Integer is Prime
#
# Integer is 4 digits long such as 1031
#
# Integer third digit is either 2 or 3 such as 1021 or 1031
#                                                ^       ^
#                                                |       |
# The count of the integer in the log is > 3
#
# If there are > 50 integers in the log matching this pattern the BOT at this location should be disabled
#
# Here is an example
#
# All the integers below are prime:
#
# log= ['8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923', '5639', '2423', '3929', '7723',
#       '8923']
#
# Here is the Count
#
# ({'2423': 10, '3929': 10, '5639': 10, '7723': 10, '8923': 11})
#
# Count = 51
# Count > 50
#
# Return "match disable bot"
#
# If these rules do not hold
#
# Return "no match continue"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'prime'

def search_disable(log)
  log = log.split
  counter = 0
  log.each do |n|
    counter += 1 if n.size == 4 && n.to_i.prime? && ['2','3'].include?(n[2]) && log.count(n) > 3
    return 'match disable bot' if counter > 50
  end
  'no match continue'
end
