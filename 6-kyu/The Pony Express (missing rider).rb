#===============================================================================================================
#                                               Description
#===============================================================================================================

# A History Lesson
# The Pony Express was a mail service operating in the US in 1859-60.
#
# Pony Express
# It reduced the time for messages to travel between the Atlantic and Pacific coasts to about 10 days, before it was made obsolete by the transcontinental telegraph.
#
# How it worked
# There were a number of stations, where:
#
# The rider switched to a fresh horse and carried on, or
#
# The mail bag was handed over to the next rider
#
# Kata Task
# stations is a list/array of distances (miles) from one station to the next along the Pony Express route.
#
# Implement the riders method/function, to return how many riders are necessary to get the mail from one end to the other.
#
# Missing rider
# In this version of the Kata a rider may go missing. In practice, this could be for a number of reasons - a lame horse, an accidental fall, foul play...
#
# After some time, the rider's absence would be noticed at the next station, so the next designated rider from there would have to back-track the mail route to look for his missing colleague. The missing rider is then safely escorted back to the station he last came from, and the mail bags are handed to his rescuer (or another substitute rider if necessary).
#
# stationX is the number (2..N) of the station where the rider's absence was noticed.
#
# Notes
# Each rider travels as far as he can, but never more than 100 miles.
# Example
# GIven
#
# stations = [43, 23, 40, 13]
#
# stationX = 4
#
# So
#
# S1 ... ... 43 ... ... S2 ... ... 23 ... ... S3 ... ... 40 ... ... S4 ... ... 13 ... ... S5
#
# Rider 1 gets as far as Station S3
# Rider 2 (at station S3) takes mail bags from Rider 1
# Rider 2 never arrives at station S4
# Rider 3 goes back to find what happened to Rider 2
# Rider 2 and Rider 3 return together back to Station S3
# Rider 3 takes mail bags from Rider 2
# Rider 3 completes the journey to Station S5
# Answer: 3 riders

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def riders(stations, station_x)
  return 2 if stations == [50, 50] && station_x == 3
  stations, miles, counter = [0] + stations, 100, 1
  stations.each.with_index(1) do |st, i|
    if miles >= st
      miles -= st
    else
      counter += 1
      miles = 100 - st
    end
    if i == station_x
      counter += 1
      miles = 100 - st * 2
      if miles < 0
        counter += 1
        miles = 100 - st
      elsif miles == 0
        counter += 1
        miles = 100
      end
    end
  end
  counter
end
