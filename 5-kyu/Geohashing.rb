#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement the Geohashing algorithm proposed by xkcd.
#
# https://imgs.xkcd.com/comics/geohashing.png
#
# Specifically, given the the Dow opening and a date in date object (optional), return the geohashing coordinates, using the following steps (adapted from explainxkcd, slightly modified):
#
# Take the provided date and convert it in the format yyyy-mm-dd- at UTC time, then append the most recent opening value for the Dow Jones Industrial Average (supplied as an argument). Dow opening provided will always be accurate to 2 decimal places, but if it has less than 2 decimal digits, pad 0s on the right (12345 => 12345.00). If no dates are provided, use current time instead.
# Pass this string through the MD5 algorithm, and output as a hexademical value.
# Divide the hash value into two 16 character halves, treat each half as base-16 decimal expansions (by appending 0. in the front, and convert them back to base 10, rounded to 6 decimal places.
# Return the result coordinates as an array.
# An example case straight out from the comic is provided:
#
# Date: 2005-05-26, Dow opening: 10458.68
# yyyy-mm-dd-dow: 2005-05-26-10458.68
# MD5: db9318c2259923d08b672cb305440f97 => db9318c2259923d0 | 8b672cb305440f97
# Coordinates (HEX): [0.db9318c2259923d0, 0.8b672cb305440f97]
# Coordinates (DEC): [0.857713, 0.544543]
# Note: You don't have to worry about the 30W Time Zone Rule.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'date'
require 'digest'

def md5(n)
  Digest::MD5.hexdigest("#{n}")
end

def geohash(dow, date = Time.new.to_date)
  m = date.month < 10 ? '0' + date.month.to_s : date.month
  d = date.day < 10 ? '0' + date.day.to_s : date.day
  obj = [date.year, m, d, "#{'%.2f' % dow}"].join('-')
  md5 = md5(obj)
  [md5[0..15], md5[16..-1]].map{|e| e.chars.map.with_index(1){|e0, i| e0.to_i(16).to_f / 16**i}.sum.round(6)}
end
