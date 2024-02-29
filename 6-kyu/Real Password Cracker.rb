#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are a h4ck3r n00b: you "acquired" a bunch of password hashes, and you want to decypher them. Based on the length, you already guessed that they must be SHA-1 hashes. You also know that these are weak passwords: maximum 5 characters long and use only lowercase letters (a-z), no other characters.
#
# Happy hacking!
#
# Notes:
#
# pre-generating the full hash table is not advised, due to the time-limit on the CW platform
# there will be only a few tests for 5-letter words (hint: start from the beginning of the alphabet)
# if your solution times out, try running it again - the CW runner is sometimes a bit slow(er)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def password_cracker(hash)
  ('a'..'zzzzz').find{|code| Digest::SHA1.hexdigest(code) == hash}
end
