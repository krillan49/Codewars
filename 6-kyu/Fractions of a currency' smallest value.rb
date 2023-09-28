#===============================================================================================================
#                                               Description
#===============================================================================================================

# Background
# In the world of investment banking, when the quantities bought and sold are so large that pricing is significant at less then the smallest available unit of 'real' currency.
#
# This is why you'll often see things quoted with a pair of buy-sell prices for a single producty that are less than a cent.
#
# Once of the niceties of trading this way is a format to display these extra small fractions. By convention, some products will be quoted not to decimal places, but to pre-agreed fractions.
#
# For example, if a product is quoted to the 16th of a cent you might see a price displayed like this: 109.28/7 which means $109.28 7/16
#
# Internally within these systems the price will still be in cents and fractions of a cent like so: 10928.4375.
#
# Kata
# In this kata you must write a class to convert between internal and display values.
#
# When constructed the class is supplied with the fractional denominator to be used in the conversion, if none is supplied, use 16 as a default.
#
# Note: You can assume that all inputs are valid for conversion. Further, all denominators will be a power of two so no need to worry about floating point approximations.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class PriceDisplayFraction
	def initialize(denominator=16)
    @d = denominator
  end

  def to_display(cents)
    "#{cents.floor/100.0}/#{((cents - cents.floor) * @d).round}"
  end

  def to_internal(display)
  	d = display.split('/')
    d[0].to_f * 100 + d[1].to_f / @d
  end
end
