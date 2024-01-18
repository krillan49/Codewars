#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement a function/class, which should return an integer if the input string is in one of the formats specified below, or null/nil/None otherwise.
#
# Format:
#
# Optional - or +
# Base prefix 0b (binary), 0x (hexadecimal), 0o (octal), or in case of no prefix decimal.
# Digits depending on base
# Any extra character (including whitespace) makes the input invalid, in which case you should return null/nil/None.
#
# Digits are case insensitive, but base prefix must be lower case.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class String
  def to_integer
    return nil if !(self =~ /\A(-|\+)?(0x[a-fA-F0-9]+|\d+|0o[0-7]+|0b[0-1]+)\z/)
    self.include?('0x') ? self.to_i(16) : self.include?('0o') ? self.to_i(8) : self.include?('0b') ? self.to_i(2) : self.to_i
  end
end
