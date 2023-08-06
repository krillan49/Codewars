#===============================================================================================================
#                                               Description
#===============================================================================================================

# Complete the solution so that it returns the number of times the search_text is found within the full_text.
#
# search_substr( full_text, search_text, allow_overlap = true )
# so that overlapping solutions are (not) counted. If the searchText is empty, it should return 0. Usage examples:
#
# search_substr('aa_bb_cc_dd_bb_e', 'bb') # should return 2 since bb shows up twice
# search_substr('aaabbbcccc', 'bbb') # should return 1
# search_substr( 'aaa', 'aa' ) # should return 2
# search_substr( 'aaa', '' ) # should return 0
# search_substr( 'aaa', 'aa', false ) # should return 1

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def search_substr(text, search, allow_overlap=true)
  return 0 if [text, search].any?{|e| e == ''}
  return text.scan(/#{search}/).size if !allow_overlap
  text.chars.each_cons(search.size).map(&:join).count{|e| e == search}
end
