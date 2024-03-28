#===============================================================================================================
#                                               Description
#===============================================================================================================

# Turn a given number (an integer > 0, < 1000) into the equivalent English words. For the purposes of this kata, no hyphen is needed in numbers 21-99.
#
# Examples:
#
# wordify(1) == "one"
# wordify(12) == "twelve"
# wordify(17) == "seventeen"
# wordify(56) == "fifty six"
# wordify(90) == "ninety"
# wordify(326) == "three hundred twenty six"
# Based on "Speech module" mission from Checkio.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

ONES = { 1=>'one', 2=>'two', 3=>'three', 4=>'four', 5=>'five', 6=>'six', 7=>'seven', 8=>'eight', 9=>'nine' }
TINS = {
  10=>'ten', 11=>'eleven', 12=>'twelve', 13=>'thirteen', 14=>'fourteen',
  15=>'fifteen', 16=>'sixteen', 17=>'seventeen', 18=>'eighteen', 19=>'nineteen'
}
TENS = { 2=>'twenty', 3=>'thirty', 4=>'forty', 5=>'fifty', 6=>'sixty', 7=>'seventy', 8=>'eighty', 9=>'ninety' }

def wordify(n)
  r = []
  r << ONES[n/100] << 'hundred' if n / 100 > 0
  if n > 19 && n.to_s[-2..-1].to_i > 19
    r << TENS[n.to_s[-2].to_i]
    r << ONES[n.to_s[-1].to_i] if n.to_s[-1].to_i > 0
  elsif n > 9 && n.to_s[-2..-1].to_i > 9
    r << TINS[n.to_s[-2..-1].to_i]
  elsif n > 0 && n.to_s[-1].to_i > 0
    r << ONES[n.to_s[-1].to_i]
  end
  r.join(' ')
end
