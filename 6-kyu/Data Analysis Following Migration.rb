#===============================================================================================================
#                                               Description
#===============================================================================================================

# Story
# Your company migrated the last 20 years of it's very important data to a new platform, in multiple phases. However, something went wrong: some of the essential time-stamps were messed up! It looks like that some servers were set to use the dd/mm/yyyy date format, while others were using the mm/dd/yyyy format during the migration. Unfortunately, the original database got corrupted in the process and there are no backups available... Now it's up to you to assess the damage.
#
# Task
# You will receive a list of records as strings in the form of [start_date, end_date] given in the ISO yyyy-mm-dd format, and your task is to count how many of these records are:
#
# correct: there can be nothing wrong with the dates, the month/day cannot be mixed up, or it would not make a valid timestamp in any other way; e.g. ["2015-04-04", "2015-05-13"]
# recoverable: invalid in its current form, but the original timestamp can be recovered, because there is only one valid combination possible; e.g. ["2011-10-08", "2011-08-14"]
# uncertain: the original timestamp cannot be retrieved, because one or both dates are ambiguous and may generate multiple valid results, or can generate only invalid results; e.g. ["2002-02-07", "2002-12-10"]
# Note: the original records always defined a non-negative duration (i.e. start_date ≤ end_date)
#
# Return your findings in an array: [ correct_count, recoverable_count, uncertain_count ]
#
# Examples
# ["2015-04-04", "2015-05-13"]  -->  correct     # nothing (could be) wrong here
# ["2013-06-18", "2013-08-05"]  -->  correct     # end date is ambiguous, but this is
#                                                # the only possible valid version
# ["2001-02-07", "2001-03-01"]  -->  correct     # both dates are ambiguous, but this is
#                                                # the only possible valid version
# ["2011-10-08", "2011-08-14"]  -->  recoverable # start date is wrong, but can be corrected
#                                                # because there is only one valid version possible
# ["2009-08-21", "2009-04-12"]  -->  recoverable # end date is wrong, but can be corrected
#                                                # because there is only one valid version possible
# ["1996-01-24", "1996-03-09"]  -->  uncertain   # end date is ambiguous (could also be 1996-09-03)
# ["2000-10-09", "2000-11-20"]  -->  uncertain   # start date is ambiguous (could also be 2000-09-10)
# ["2002-02-07", "2002-12-10"]  -->  uncertain   # both dates are ambiguous, and there are
#                                                # multiple possible valid versions

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'date'

def valid_dates?(d1, d2)
  Date.valid_date?(*d1) && Date.valid_date?(*d2) && (Date.new(*d2) - Date.new(*d1)).to_i >= 0
end

def has_one?(yst, st, yen, en)
  sta, ena = [st, en].map{|e| [e, e.reverse]}
  sta.product(ena).uniq.sum{|s, e| valid_dates?(yst+s, yen+e) ? 1 : 0} == 1
end

def check_dates(records)
  res = [0, 0, 0]
  records.each do |strec, enrec|
    starr, enarr = [strec, enrec].map{|rec| rec.split('-').map(&:to_i)}
    wr = has_one?(starr[0..0], starr[1..2], enarr[0..0], enarr[1..2])
    valid_dates?(starr, enarr) ? res[wr ? 0 : 2] += 1 : res[wr ? 1 : 2] += 1
  end
  res
end
