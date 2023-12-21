#===============================================================================================================
#                                               Description
#===============================================================================================================

# Implement String#parse_mana_cost, which parses Magic: the Gathering mana costs expressed as a string and returns a Hash with keys being kinds of mana, and values being the numbers.
#
# Don't include any mana types equal to zero.
#
# Format is:
#
# optionally natural number representing total amount of generic mana (use key *)
# optionally followed by any combination of w, u, b, r, g (case insensitive in input, return lower case in output), each representing one mana of specific color.
# If case of Strings not following specified format, return nil/null/None.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class String
  def parse_mana_cost
    return nil if self.downcase.tr('0-9wubrg', '') != ''
    return {} if self.tr('0', '') == ''
    m = {}
    n = self.tr('^0-9',' ').split.map(&:to_i).sum
    m['*'] = n if n > 0
    self.downcase.tr('0-9', '').chars.uniq.each{|c| m[c] = self.downcase.count(c)}
    m
  end
end
