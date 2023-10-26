#===============================================================================================================
#                                               Description
#===============================================================================================================

# Many items that are available for sale have a barcode somewhere on them - this allows them to be scanned at a checkout.
#
# Your task is to create an algorithm to convert a series of ones and zeroes from the scanner into an Universal Product Code (UPC). You can learn more about UPC from Wikipedia. We will be using the UPC-A formatting.
#
# Specifications
# Each barcode follows the pattern: SLLLLLLMRRRRRRE
#
# S, M and E are guard bars (start, middle, end). These are constants.
#
# L and R are digits. They are 7 modules wide and are variables. They can be of 1 of 10 patterns.
#
# Each item is described using the pattern below. The number indicates how many modules wide, the letter is the colour of the bar: W for white and B for black.
#
# The guard bars:
#
# S: 1B1W1B
# M: 1W1B1W1B1W
# E: 1B1W1B
# These are the L digits:
#
# 0: 3W2B1W1B
# 1: 2W2B2W1B
# 2: 2W1B2W2B
# 3: 1W4B1W1B
# 4: 1W1B3W2B
# 5: 1W2B3W1B
# 6: 1W1B1W4B
# 7: 1W3B1W2B
# 8: 1W2B1W3B
# 9: 3W1B1W2B
# You will be provided with a preloaded dictionary DIGITS which contains the above information (L digits and guard bar patterns).
#
# R digits are the inverse of L digits, e.g.:
#
# 0: 3B2W1B1W
# Your task
# Your function will receive a string consisting of ones (black) and zeroes (white), and should return the UPC as a string. Each one or zero will correspond to one module of width. Only valid barcodes will be supplied, and they will always be presented from left to right. They will start with the first black line of the guard bars.
#
# Example
# barcode_scanner("10101110110110111000101100010110101111011011101010111001011100101110010111001011011001000010101")
# => "789968000023"
#
# because:
# "101 0111011 0110111 0001011 0001011 0101111 0110111 01010 1110010 1110010 1110010 1110010 1101100 1000010 101"
# " S     7       8       9       9       6       8      M      0       0       0       0       2       3     E "

#===============================================================================================================
#                                               Solution
#===============================================================================================================

LE = {"0"=>"0001101", "1"=>"0011001", "2"=>"0010011", "3"=>"0111101", "4"=>"0100011", "5"=>"0110001", "6"=>"0101111", "7"=>"0111011", "8"=>"0110111", "9"=>"0001011"}
RA = {"0"=>"1110010", "1"=>"1100110", "2"=>"1101100", "3"=>"1000010", "4"=>"1011100", "5"=>"1001110", "6"=>"1010000", "7"=>"1000100", "8"=>"1001000", "9"=>"1110100"}

def barcode_scanner(barcode)
  l = barcode[3..44].chars.each_slice(7).map(&:join).map{|e| LE.key(e)}
  r = barcode[50..-4].chars.each_slice(7).map(&:join).map{|e| RA.key(e)}
  (l + r).join
end
