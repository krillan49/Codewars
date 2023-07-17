#===============================================================================================================
#                                               Description
#===============================================================================================================

# The Caesar cipher is a notorious (and notoriously simple) algorithm for encrypting a message: each letter is shifted a certain constant number of places in the alphabet. For example, applying a shift of 5 to the string "Hello, world!" yields "Mjqqt, btwqi!", which is jibberish.
#
# In this kata, your task is to decrypt Caesar-encrypted messages using nothing but your wits, your computer, and a set of the 1000 (plus a few) most common words in English in lowercase (made available to you as a preloaded variable named WORDS, which you may use in your code as if you had defined it yourself).
#
# Given a message, your function must return the most likely shift value as an integer.
# A few hints:
#
# Be wary of punctuation
# Shift values may not be higher than 25

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def break_caesar(message)
  m = message.downcase.tr('^a-z ', '').chars
  ind = m.map.with_index{|e, i| e == ' ' ? i : nil}.compact
  n = 1
  counter = 0
  until m.join.split.count{|w| WORDS.include?(w)} >= m.join.split.size / 2.0
    m.map!{|c| c == ' ' ? c : c.ord - n < 97 ? ((c.ord - 97) - n % 26 + 123).chr : (c.ord - n).chr}
    counter += 1
  end
  counter
end
