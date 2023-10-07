#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create a method called wait_on_threads that accepts an array of threads (can be empty) and waits until all of them finish. For example:
#
# thread1 = Thread.new do
#   # do somethng
# end
# thread2 = Thread.new do
#   # do somethng else
# end
#
# wait_on_threads( [thread1,thread2] )
# # Should wait inside the method until both thread1 and thread2
# # finish whatever they were doing and exit.
# You can read more about threads in wikipedia: http://en.wikipedia.org/wiki/Thread_(computing)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

def wait_on_threads(threads)
  threads.each(&:join)
end
