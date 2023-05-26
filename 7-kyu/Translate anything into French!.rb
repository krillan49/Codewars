#===============================================================================================================
#                                               Description
#===============================================================================================================

# Sacrebleu!
#
# French can be pretty hard to master, and it might take you quite a while if you want to learn it from scratch...
#
# Fortunately, we come to the rescue with this kata, and you will soon be able to translate anything into French.
#
# French often use the words "Baguette" (in reference to their marvelous bread: https://en.wikipedia.org/wiki/Baguette). Moreover, they like to shout "Encore, encore!" at the end of an accordeon concert. Here we will shout "Encore!" at the end of our sentence.
#
# In this kata, our i_speak_french method will translate any sentence argument into its French translation :
#
# Every word from the sentence must be translated into "Baguette" (if it is the begining of the sentence), or "baguette" otherwise.
#
# Every sentence must end by an "Encore!" exclamation. A sentence is ended by a final dot ("."), or by the end of the string argument.
#
# You will expect a string as argument, no non-alphabetical values will be used.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# Use split and join

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def i_speak_french(sentence)
  sentence.split('.').map{|str| str.split.map{|_| 'baguette'}.join(' ').capitalize + ' Encore!'}.join(' ')
end
