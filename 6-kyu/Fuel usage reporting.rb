#===============================================================================================================
#                                               Description
#===============================================================================================================

# John is developing a system to report fuel usage but needs help with the coding.
#
# First, he needs you to write a function that, given the actual consumption (in l/100 km) and remaining amount of petrol (in l), will give you how many kilometers you'll be able to drive.
#
# Second, he needs you to write a function that, given a distance (in km), a consumption (in l/100 km), and an amount of petrol (in l), will return one of the following: If you can't make the distance without refueling, it should return the message "You will need to refuel". If you can make the distance, the function will check every 100 km and produce an array with [1:kilometers already driven. 2: kilometers till end. 3: remaining amount of petrol] and return all the arrays inside another array ([[after 100km], [after 200km], [after 300km]...])
#
# PLEASE NOTE: any of the values with decimals that you return should be rounded to 2 decimals

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def total_kilometers(cons, petrol)
  (petrol * 100.0 / cons).round(2)
end

def check_distance(distance, cons, petrol)
  return 'You will need to refuel' if petrol * 100 / cons < distance
  (0..distance/100).map{|e| [100 * e, distance - 100 * e, (petrol - cons * e).round(2)]}
end
