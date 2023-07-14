#===============================================================================================================
#                                               Description
#===============================================================================================================

# Write a method which takes arguments:
#
# hash
# keys (comma-separated symbols or strings)
# and it splits hash by given keys and returns array of hashes.
#
# If a key given as an argument is not present in the hash, the method should raise an exception
#
# In case there are any empty hash after splitting, it should be removed from resultant array.
#
# For example:
#
# # returns [ {:a=>1, :b=>2}, {:c=>3, :d=>4}, {:e=>5, :f=>6} ]
# split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :c, :e )
#
# #returns [ {:a=>1}, {:b=>2, :c=>3, :d=>4, :e=>5}, {:f=>6} ]
# split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, :b, :f )
#
# #returns [ {"a"=>1, "b"=>2, "c"=>3}, {"d"=>4, "e"=>5, "f"=>6} ]
# split_hash_by_key( { 'a'=>1, 'b'=>2, 'c'=>3, 'd'=>4, 'e'=>5, 'f'=>6 }, 'd' )
#
# #returns [ {:a => 1, :b => 2} ]
# split_hash_by_key( {:a => 1, :b => 2}, :a )
#
# # raises an exception
# split_hash_by_key( { :a=>1, :b=>2, :c=>3, :d=>4, :e=>5, :f=>6 }, 'b' )

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def split_hash_by_key(hash, *args)
  raise Error if args.any?{|k| !hash.keys.include?(k)}
  hash.to_a.slice_when{|a, b| args.include?(b[0])}.map(&:to_h)
end
