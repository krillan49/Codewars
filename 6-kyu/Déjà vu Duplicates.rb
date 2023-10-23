#===============================================================================================================
#                                               Description
#===============================================================================================================

# It might be déjà vu, or it might be a duplicate day. You’re well trained in the arts of cleaning up duplicates. Someone has hacked your database and injected all kinds of duplicate records into your tables. You don’t have access to modify the data in the tables or restore the tables to a previous time because the DBA’s are gone.
#
# You are provided with an array of employees from the server. Your task is to write the findDuplicates function to remove the duplicate records after they are sent down to the client.
#
# Employee Class:
#
# class Employee
#   attr_reader :first_name
#   attr_reader :last_name
#   attr_reader :user_name
#   def initialize(f_name,l_name,u_name)
#     @first_name = f_name
#     @last_name = l_name
#     @user_name = u_name
#   end
# end
# The result of calling the findDuplicates function should be an array of the Employee objects that are the duplicates. findDuplicates should also perform an in place modification of the array it's given (employees), removing the duplicate values.
#
# Assumptions:
#
# You can assume that the employees parameter passed in to findDuplicates is always an array.
# You can also assume that the employees array is a flat array.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def find_duplicates(emp)
  arr = []
  emp.each.with_index do |o, i|
    d = emp[i+1..-1].find{|e| e.first_name == o.first_name && e.last_name == o.last_name && e.user_name == o.user_name}
    arr << d if d
  end
  del = arr.map{|o| emp.index(o)}
  emp.delete_if{|e| del.include?(emp.index(e))}
  arr
end
