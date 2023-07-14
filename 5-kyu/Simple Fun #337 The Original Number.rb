#===============================================================================================================
#                                               Description
#===============================================================================================================

# John has an important number, and he doesn't want others to see it.
#
# He decided to encrypt the number, using the following steps:
#
# His number is always a non strict increasing sequence
# ie. "123"
#
# He converted each digit into English words.
# ie. "123"--> "ONETWOTHREE"
#
# And then, rearrange the letters randomly.
# ie. "ONETWOTHREE" --> "TTONWOHREEE"
# John felt that his number were safe in doing so. In fact, such encryption can be easily decrypted :(
#
# Given the encrypted string s, your task is to decrypt it, return the original number in string format.
#
# Note, You can assume that the input string s is always valid; It contains only uppercase Letters; The decrypted numbers are arranged in ascending order; The leading zeros are allowed.
#
# Example
# For s = "ONE", the output should be 1.
#
# For s = "EON", the output should be 1 too.
#
# For s = "ONETWO", the output should be 12.
#
# For s = "OONETW", the output should be 12 too.
#
# For s = "ONETWOTHREE", the output should be 123.
#
# For s = "TTONWOHREEE", the output should be 123 too.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

LET = {
  'Z'=>%w[Z E R O], 'W'=>%w[T W O], 'U'=>%w[F O U R], 'X'=>%w[S I X], 'G'=>%w[E I G H T], #uniq1
  'O'=>%w[O N E], 'R'=>%w[T H R E E], 'F'=>%w[F I V E], 'S'=>%w[S E V E N], #uniq if no uniq1
  'I'=>%w[N I N E]
}
NUM = {'ZERO'=>'0','ONE'=>'1','TWO'=>'2','THREE'=>'3','FOUR'=>'4','FIVE'=>'5','SIX'=>'6','SEVEN'=>'7','EIGHT'=>'8','NINE'=>'9'}

def original_number(s)
  res = []
  hh = s.chars.uniq.map{|c| [c, s.count(c)]}.to_h
  %w[Z W U X G O R F S I].each do |l|
    if hh[l] && hh[l] > 0
      hh[l].times{res << LET[l].join}
      counter = hh[l]
      LET[l].each{|c| hh[c] -= counter}
    end
  end
  res.map{|w| NUM[w]}.sort.join
end
