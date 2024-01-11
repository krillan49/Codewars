#===============================================================================================================
#                                               Description
#===============================================================================================================

# You're a support engineer and you have to write a regex that captures the following information from our log files:
#
# the date
# the log level (ERROR, INFO or DEBUG),
# the user
# the main function
# the sub function
# the logged message
# You asked your supervisor about the rules defining all the logs. He told you that: the sub function may or may not be here, if no sub-function return undefined, the log level can only be one of the 3 presented, the logged message contains any kind of character, all fields are separated by arbitrary spaces (but at least one). For the date format, just standard ISO but don't worry about validation (see PS). Username cannot contains spaces.
#
# The regex should not match if the log doesn't follow above rules.
#
# Examples
# Matching logs
# <DATE> <LOG LEVEL> [<USER>:<FUNCTION>(:<SUBFUNCTION>)] <MESSAGE>
# 2003-07-08 16:49:45,896 ERROR [user1:mainfunction:subfunction] We have a problem
# 2003-07-08 16:49:46,896 INFO [user1:mainfunction] We don't have a problem
# Wrong logs
# Invalid log level
#
# 2003-07-08 16:49:45,896 CRITICAL [user1:mainfunction:subfunction] We have a problem
# Invalid timestamp (no seconds/minutes)
#
# 2003-07-08 16:45,896 ERROR [user1:mainfunction:subfunction] We have a problem
# Invalid username (contains spaces)
#
# 2003-07-08 16:45:13,896 ERROR [best user ever:mainfunction:subfunction] We have a problem
# PS: for simplicity of this kata dates don't need to be valid, e.g. 2223-13-41 26:65:13,896 is accepted, I suggest you to look here if you want to train for that: http://www.codewars.com/kata/548db0bd1df5bbf29b0000b7

#===============================================================================================================
#                                               Solution
#===============================================================================================================

logparser = /^(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3}) +(ERROR|INFO|DEBUG) +\[(\w+):(\w+):?(\w+)?\] +([a-zA-Z' ]+)$/
