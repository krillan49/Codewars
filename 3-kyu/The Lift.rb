#===============================================================================================================
#                                               Description
#===============================================================================================================

# Synopsis
# A multi-floor building has a Lift in it.
#
# People are queued on different floors waiting for the Lift.
#
# Some people want to go up. Some people want to go down.
#
# The floor they want to go to is represented by a number (i.e. when they enter the Lift this is the button they will press)
#
# BEFORE (people waiting in queues)               AFTER (people at their destinations)
#                    +--+                                          +--+
#   /----------------|  |----------------\        /----------------|  |----------------\
# 10|                |  | 1,4,3,2        |      10|             10 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  9|                |  | 1,10,2         |       9|                |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  8|                |  |                |       8|                |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  7|                |  | 3,6,4,5,6      |       7|                |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  6|                |  |                |       6|          6,6,6 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  5|                |  |                |       5|            5,5 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  4|                |  | 0,0,0          |       4|          4,4,4 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  3|                |  |                |       3|            3,3 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  2|                |  | 4              |       2|          2,2,2 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  1|                |  | 6,5,2          |       1|            1,1 |  |                |
#   |----------------|  |----------------|        |----------------|  |----------------|
#  G|                |  |                |       G|          0,0,0 |  |                |
#   |====================================|        |====================================|
# Rules
# Lift Rules
# The Lift only goes up or down!
# Each floor has both UP and DOWN Lift-call buttons (except top and ground floors which have only DOWN and UP respectively)
# The Lift never changes direction until there are no more people wanting to get on/off in the direction it is already travelling
# When empty the Lift tries to be smart. For example,
# If it was going up then it may continue up to collect the highest floor person wanting to go down
# If it was going down then it may continue down to collect the lowest floor person wanting to go up
# The Lift has a maximum capacity of people
# When called, the Lift will stop at a floor even if it is full, although unless somebody gets off nobody else can get on!
# If the lift is empty, and no people are waiting, then it will return to the ground floor
# People Rules
# People are in "queues" that represent their order of arrival to wait for the Lift
# All people can press the UP/DOWN Lift-call buttons
# Only people going the same direction as the Lift may enter it
# Entry is according to the "queue" order, but those unable to enter do not block those behind them that can
# If a person is unable to enter a full Lift, they will press the UP/DOWN Lift-call button again after it has departed without them
# Kata Task
# Get all the people to the floors they want to go to while obeying the Lift rules and the People rules
# Return a list of all floors that the Lift stopped at (in the order visited!)
# NOTE: The Lift always starts on the ground floor (and people waiting on the ground floor may enter immediately)
#
# I/O
# Input
# queues a list of queues of people for all floors of the building.
# The height of the building varies
# 0 = the ground floor
# Not all floors have queues
# Queue index [0] is the "head" of the queue
# Numbers indicate which floor the person wants go to
# capacity maximum number of people allowed in the lift
# Parameter validation - All input parameters can be assumed OK. No need to check for things like:
#
# People wanting to go to floors that do not exist
# People wanting to take the Lift to the floor they are already on
# Buildings with < 2 floors
# Basements
# Output
# A list of all floors that the Lift stopped at (in the order visited!)

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Lift
  attr_reader :res
  def initialize(queues, capacity)
    @queues = queues
    @floor = 0
    @dir = 'up'
    @lift = []
    @capacity = capacity
    @res = [0]
  end

  def start
    start = false
    until @queues.all?(&:empty?) && @lift.empty?
      if @lift.find{|p| p == @floor}
        passegers_out
        @res << @floor
      end
      dir_change if (@floor == 0 && start) || @floor == @queues.size - 1
      if @queues[@floor].find{|p| @dir == 'up' ? p > @floor : p < @floor}
        passegers_in
        @res << @floor if @res[-1] != @floor
      end
      floor_change
      start = true
    end
    @res << 0 if @res[-1] != 0
  end

  private

  def passegers_out
    @lift.reject!{|p| p == @floor}
  end

  def passegers_in
    passegers = @queues[@floor].select{|p| @dir == 'up' ? p > @floor : p < @floor}.first(@capacity - @lift.size)
    @lift += passegers
    passegers.each {|e| @queues[@floor].delete_at(@queues[@floor].index(e))}
  end

  def floor_change
    @dir == 'up' ? @floor += 1 : @floor -= 1
  end

  def dir_change
    @dir == 'up' ? @dir = 'down' : @dir = 'up'
  end
end

def the_lift(queues, capacity)
  return [0] if queues.all?(&:empty?)
  lift = Lift.new(queues, capacity)
  lift.start
  lift.res
end
