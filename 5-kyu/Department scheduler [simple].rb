#===============================================================================================================
#                                               Description
#===============================================================================================================

# You are the Head of the Department and your responsibilities include creating monthly schedules for your employees.
#
# Your employees work in shifts. Each shift is 24 hours. Employment policy prohibits employee from working more than 24 hours in a row, so one employee cannot have two consecutive shifts.
#
# There must be n people at work each day. Arrange employees over the schedule so that their workload is equal or differs from others minimally (i. e. difference between any two employees must not exceed one shift).
#
# If it is not possible to ensure one employee does not work two days in a row due to insufficient staff, return None/null/nil.
#
# Arguments
# Array of employee names as strings. Example: ['Smith", 'Jones', 'Gonzalez', 'White', 'Jackon', 'Taylor'].
# Month and year in 'MMYYYY' format.
# Number of employees per shift.
# Output
# Array of arrays, each representing a day in the given month. Each day array contains three employee names.
# #Example
#
#    schedule(['Smith', 'Jones', 'Gonzalez', 'White', 'Jackon', 'Taylor'], '022015', 3)
# may return
#
#    [['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson'],
#     ['Smith', 'Jones', 'Gonzalez'],
#     ['White', 'Jackson', 'Taylor'],
#     ['Jones', 'Smith', 'Gonzalez'],
#     ['Taylor', 'White', 'Jackson']]
# Here each employee has 14 shifts and no one has two consecutive shifts.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

require 'date'

DAYS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def schedule(employees, month, n)
  return nil if employees.size < n * 2
  m, y = month[0..1].to_i, month[2..-1].to_i
  days = m == 2 && Date.leap?(y) ? 29 : DAYS[m-1]
  (employees * (days * n / employees.size.to_f).ceil)[0..days*n-1].each_slice(n).to_a
end
