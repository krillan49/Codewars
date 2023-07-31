#===============================================================================================================
#                                               Description
#===============================================================================================================

# Your task is to write a regular expression (regex) that will match a string only if it contains at least one valid date, in the format [mm-dd] (that is, a two-digit month, followed by a dash, followed by a two-digit date, surrounded by square brackets).
#
# You should assume the year in question is not a leap year. Therefore, the number of days each month should have are as follows:
#
# 1. January - 31 days
# 2. February - 28 days (leap years are ignored)
# 3. March - 31 days
# 4. April - 30 days
# 5. May - 31 days
# 6. June - 30 days
# 7. July - 31 days
# 8. August - 31 days
# 9. September - 30 days
# 10. October - 31 days
# 11. November - 30 days
# 12. December - 31 days
# All text outside a valid date can be ignored, including other invalid dates.
#
# For example:
#
# "[01-23]" // January 23rd is a valid date
# "[02-31]" // February 31st is an invalid date
# "[02-16]" // valid
# "[ 6-03]" // invalid format
# "ignored [08-11] ignored" // valid
# "[3] [12-04] [09-tenth]" // December 4th is a valid date

#===============================================================================================================
#                                               Solution
#===============================================================================================================

valid_date = /.*\[(((01|03|05|07|08|10|12)-(0[1-9]|[1-2]\d|3[0-1]))|((04|06|09|11)-(0[1-9]|[1-2]\d|30))|(02-(0[1-9]|1\d|2[0-8])))\].*/
