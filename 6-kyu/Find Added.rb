#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are given two strings (st1, st2) as inputs. Your task is to return a string containing the numbers in st2 which are not in str1. Make sure the numbers are returned in ascending order. All inputs will be a string of numbers.
#
# Here are some examples:
#
# findAdded('4455446', '447555446666'); // '56667'
# findAdded('44554466', '447554466'); // '7'
# findAdded('9876521', '9876543211'); // '134'
# findAdded('678', '876'); // ''
# findAdded('678', '6'); // ''

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def findAdded(st1, st2)
  s1 = st1.chars.uniq.map{|c| st2.include?(c) ? [c, st1.count(c)] : nil}.compact.to_h
  s2 = st2.chars.uniq.map{|c| [c, st2.count(c)]}.to_h
  s2.merge(s1){|k, ov, nv| ov - nv}.map{|k, v| v < 0 ? k * 0 : k * v}.join.chars.sort.join
end
