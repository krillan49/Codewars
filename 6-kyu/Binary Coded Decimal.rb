#===============================================================================================================
#                                               Description
#===============================================================================================================

# Convert a number to a binary coded decimal (BCD).
#
# You can assume input will always be an integer. If it is a negative number then simply place a minus sign in front of the output string. Output will be a string with each digit of the input represented as 4 bits (0 padded) with a space between each set of 4 bits.
#
# Ex.
#
# n =  10 -> "0001 0000"
# n = -10 -> "-0001 0000"

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Fixnum

	def to_bcd
		m = self < 0 ? '-' : ''
		m + self.to_s.tr('-', '').chars.map{|d| d.to_i.to_s(2)}.map{|d| d.size < 4 ? '0'*(4-d.size)+d : d}.join(' ')
	end

end
