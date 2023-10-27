#===============================================================================================================
#                                               Description
#===============================================================================================================

# All Unix user know the command line history. This one comes with a set of useful commands know as the bang command.
#
# For more information about the history command line you can take a look at:
#
# The man page -> simply type man history in your terminal.
# The online man page here.
# And for more information about the bang command you can read this article
# For this 5th kata we will explore the !?string command, according to the man page this one refer to the most recent command preceding the current postition in the history list containing string.
#
# In this kata you should complete a function that take in an string that correspond to s, and an history with the following format:
#
#   1  cd /pub
#   2  more beer
#   3  lost
#   4  ls
#   5  touch me
#   6  chmod 000 me
#   7  more me
#   8  history
# and that should return the most recent command line that contains executed command line s, for example with s="me" and the above history it should return more me. If user ask for a s without any know entry for example n=you here, the function should return !you: event not found.
#
# Note: Lot of the command line comes form some geeky t-shirt and form this excellent page.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bang_contain_string(s, history)
  history.split("\n").map{|w| w.strip.split[1..-1].join(' ')}.select{|w| w.include?(s)}[-1] || "!#{s}: event not found"
end
