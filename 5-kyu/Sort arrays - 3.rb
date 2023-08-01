#===============================================================================================================
#                                               Description
#===============================================================================================================

# This time the input is a sequence of course-ids that are formatted in the following way:
#
# name-yymm
# The return of the function shall first be sorted by yymm, then by the name (which varies in length).

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def sortme(courses)
  courses.sort_by{|w| w.split('-').reverse}
end
