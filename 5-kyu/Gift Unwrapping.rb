#===============================================================================================================
#                                               Description
#===============================================================================================================

# You will be given 10 very well-wrapped gifts, and your job is to unwrap them. Each gift is in the form of a non-zero integer wrapped inside anywhere from 0 to 15 layers of different types of objects: Range, String, Array, and Hash. There is also plenty of packing foam spread throughout the wrapping job, in the form of 0s. You must ignore these and find the non-zero integer, and return it.
#
# Here are some examples of gifts that wrap the number 42:
#
# 0..42
# ["42", "0"]
# {0..0=>42..0, "0"=>{"0"=>0..0}}
# [{0..0=>[0..0, 0..0, 0..0]}, "42", 0..0]
# {[{{0..0=>{{0..0=>"0", [0..0, 0..0, 0..0, "0", 0..0, 0..0]=>0..0}=>0..0, "0"=>{0..0=>"0"}}}=>{0..0=>"0"}, "0"=>{"0"=>0..0, {0..0=>{0..0=>"0"}, "0"=>0..0}=>0..0}, ["0", "0", 0..0]=>0..0}, 0..0, 0..0, [0..0, "0", "0"], 0..0]=>["0"], [0..0, 0..42, [0..0, 0..0, "0"]]=>0..0, [0..0]=>{0..0=>"0"}}

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def unwrap(gift)
  "#{gift}".gsub(/[^0-9]/,' ').split.reject{|e| e == '0'}.join.to_i
end
