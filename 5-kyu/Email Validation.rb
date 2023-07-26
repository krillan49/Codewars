#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a function validate() that takes a string email address and returns true if valid, false otherwise.
#
# A valid email is defined as:
#
# Has an @ symbol within
# Has dots splitting up two or more strings at the right of the @.
# Has contents to the left of the @. Only one part is needed. Multiply parts should be seperated with dots.
# For example:
#
# validate('joe@example.com') => true
# validate('joe.codewars@example.com') => true
# validate('joe') => false # does not contain @ symbol, does not contain two or more strings seperated by a dot after the @ symbol
# validate('@.') => false #nothing to the left of the @, does not adhere to rule 2 in the description

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def validate(email)
  !!(email =~ /[\w\-\.]+@[\w\-]+(\.[\w\-]+)+/)
end
