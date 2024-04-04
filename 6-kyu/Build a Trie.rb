#===============================================================================================================
#                                               Description
#===============================================================================================================

# The goal of this kata is to implement trie (or prefix tree) using dictionaries (aka hash maps or hash tables), where:
#
# the dictionary keys are the prefixes
# the value of a leaf node is None in Python, nil in Ruby, null in Groovy, JavaScript and Java, and Nothing in Haskell.
# the value for empty input is {} in Python, Ruby, Javascript and Java (empty map), [:] in Groovy, and Trie [] in Haskell.
# Examples:
#
# >> build_trie()
# => {}
# >> build_trie("")
# => {}
# >> build_trie("trie")
# => {"t" => {"tr" => {"tri" => {"trie" =>  nil}}}}
# >> build_trie("tree")
# => {"t" => {"tr" => {"tre" => {"tree" =>  nil}}}}
# >> build_trie("trie", "trie")
# => {"t" => {"tr" => {"tri" => {"trie" =>  nil}}}}
# >> build_trie("A","to", "tea", "ted", "ten", "i", "in", "inn")
# => {"A" =>  nil, "t" => {"to" =>  nil, "te" => {"tea" =>  nil, "ted" =>  nil, "ten" =>  nil}}, "i" => {"in" => {"inn" =>  nil}}}
# >> build_trie("true", "trust")
# => {"t" => {"tr" => {"tru" => {"true" =>  nil, "trus" => {"trust" =>  nil}}}}}

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def bt_rec(hh, i=1)
  hh.each do |k, v|
    v = v.reject{|e| e == k}
    if v.empty?
      hh[k] = nil
    else
      hhh = {}
      v.each{|e| hhh[e[0..i]] ? hhh[e[0..i]] << e : hhh[e[0..i]] = [e]}
      hh[k] = bt_rec(hhh, i+1)
    end
  end
  hh
end

def build_trie(*words)
  words.reject!(&:empty?)
  return {} if words.empty? || words[0].empty?
  hh = {}
  words.each{|e| hh[e[0]] ? hh[e[0]] << e : hh[e[0]] = [e]}
  bt_rec(hh)
end
