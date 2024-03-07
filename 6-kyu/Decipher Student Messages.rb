#===============================================================================================================
#                                               Description
#===============================================================================================================

# Two students are giving each other test answers during a test. They don't want to be caught so they are sending each other coded messages.
#
# For example one student is sending the following message: "Answer to Number 5 Part b". He starts with a square grid (in this example a 5x5 grid) and he writes the message down, including with spaces:
#
# Answe
# r to
# Numbe
# r 5 P
# art b
# He then starts writing the message down one column at a time, from the top to the bottom. The encoded message is now: "ArNran u rstm5twob  e ePb"
#
# You are the teacher of this class. Your job is to decipher the messages and bust the students.
#
# Task
# Complete the function that takes one parameter (the encoded message) and return the original message.
#
# Note: The length of the string is always going to be a perfect square.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def decipher_message(message)
  return message if message.size < 4
  n = Math.sqrt(message.size).to_i
  message.chars.each_slice(n).to_a.transpose.join
end
