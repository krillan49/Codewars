#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a Deaf Grandma program. Whatever you say to grandma (whatever you type in), she should respond with HUH?! SPEAK UP, SONNY!, unless you shout it (type in all capitals).
# If you shout, she can hear you (or at least she thinks so) and yells back, NO, NOT SINCE 1938! You can't stop talking to grandma until you shout BYE.
# When you shout BYE, grandma shouts back OK, BYE! and end the conversation.*
# Your input is an array with a list of strings with all the words/sentences you say in order.
# You can expect there is aways a BYE. Although it is not necessarily the last word in the list.
# Your output is an array with a list of strings and every sentence Pine's grandma replies.
# Words/sentences is always a string.
# Example:
#
# you = ['hi grandma', 'WHAT', 'bye', 'BYE']
#
# grandma = ['HUH?!  SPEAK UP, SONNY!', 'NO, NOT SINCE 1938!', 'HUH?!  SPEAK UP, SONNY!', 'OK, BYE!'
#
# Based, inspired and stolen with love from "Learn to Program", by Chris Pine

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def deaf_grandma(you)
  you.pop(you.size - you.index('BYE') - 1)
  you.map{|e| e == 'BYE' ? 'OK, BYE!' : e == e.upcase ? 'NO, NOT SINCE 1938!' : 'HUH?! SPEAK UP, SONNY!'}
end
