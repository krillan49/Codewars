#===============================================================================================================
#                                               Description
#===============================================================================================================

# Aoccdrnig to a rscheearch at Cmabrigde Uinervtisy, it deosn't mttaer in waht oredr the ltteers in a wrod are, the olny iprmoetnt tihng is taht the frist and lsat ltteer be at the rghit pclae. The rset can be a toatl mses and you can sitll raed it wouthit porbelm. Tihs is bcuseae the huamn mnid deos not raed ervey lteter by istlef, but the wrod as a wlohe.
#
# Interesting article about this.
#
# Task:
# Write a function which mix inner characters in each word,first and last character stays untouched.Notice that punctuation mark is not a part of a word!By word we define only alphanumeric characters.
# Requirements:
# -at least 10% of all changeable words must differ from original.
# If you solve this kata,check how many percent of changeable words you have changed.If you reach 100% you will get a reward!

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def jumble(string)
  return '' if string == ''
  string.split
        .map do |w|
          w.chars
          .slice_when{|a, b| /[0-9a-z]/i === a && /[^0-9a-z]/i === b}
          .map{|a| a.size > 3 ? [a[0]] + a[1..-2].shuffle + [a[-1]] : a}
        end
        .map(&:join)
        .join(' ')
end
