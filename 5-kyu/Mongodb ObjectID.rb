#===============================================================================================================
#                                               Description
#===============================================================================================================

# MongoDB is a noSQL database which uses the concept of a document, rather than a table as in SQL. Its popularity is growing.
#
# As in any database, you can create, read, update, and delete elements. But in constrast to SQL, when you create an element, a new field _id is created. This field is unique and contains some information about the time the element was created, id of the process that created it, and so on. More information can be found in the MongoDB documentation (which you have to read in order to implement this Kata).
# https://www.mongodb.com/docs/manual/reference/method/ObjectId/
#
# So let us implement the following helper which will have 2 methods:
#
# one which verifies that the string is a valid Mongo ID string, and
# one which finds the timestamp from a MongoID string
# Note:
#
# If you take a close look at a Codewars URL, you will notice each kata's id (the XXX in http://www.codewars.com/dojo/katas/XXX/train/javascript) is really similar to MongoDB's ids, which brings us to the conjecture that this is the database powering Codewars.
#
# Examples
# The verification method will return true if an element provided is a valid Mongo string and false otherwise:
#
# Mongo.is_valid('507f1f77bcf86cd799439011')  # true
# Mongo.is_valid('507f1f77bcf86cz799439011')  # false
# Mongo.is_valid('507f1f77bcf86cd79943901')   # false
# Mongo.is_valid('111111111111111111111111')  # true
# Mongo.is_valid(111111111111111111111111)    # false
# Mongo.is_valid('507f1f77bcf86cD799439011')  # false (we arbitrarily only allow lowercase letters)
# The timestamp method will return a date/time object from the timestamp of the Mongo string and false otherwise:
#
# # Mongo.get_timestamp should return a datetime object
#
# Mongo.get_timestamp('507f1f77bcf86cd799439011')  # Wed Oct 17 2012 21:13:27 GMT-0700 (Pacific Daylight Time)
# Mongo.get_timestamp('507f1f77bcf86cz799439011')  # false
# Mongo.get_timestamp('507f1f77bcf86cd79943901')   # false
# Mongo.get_timestamp('111111111111111111111111')  # Sun Jan 28 1979 00:25:53 GMT-0800 (Pacific Standard Time)
# Mongo.get_timestamp(111111111111111111111111)    # false
# When you will implement this correctly, you will not only get some points, but also would be able to check creation time of all the kata here :-)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Mongo
  def self.is_valid(s)
    s.class == String && s.match?(/^[a-f0-9]{24}$/)
  end

  def self.get_timestamp(s)
    return false until self.is_valid(s)
    DateTime.parse(Time.at(s[0..7].to_i(16)).to_s)
  end
end
