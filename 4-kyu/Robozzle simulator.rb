#===============================================================================================================
#                                               Description
#===============================================================================================================

# Introduction
# Robozzle is a puzzle game which requires the player to write programs to get a robot through a maze, collecting all stars on it.

# The best way to understand the game is probably to play it, please have a try on http://www.robozzle.com/

# Your ultimate goal in the life is now to write a Robozzle simulator.

# The task
# You'll write a robozzle function which will take the board, the robot initial state and the program in paramters.

# The board will be a 2 dimensions array containing cells. A cell is a Hash containing 2 elements:

# color: the color of the cell (one of blue, green or red)
# star: a boolean indicating if the cell contains a star
# The robot will be a Hash containing the following elements:

# x: the x position of the robot on the board
# y: the y position on the roboat board
# direction: one of right, left, up, down
# Coordinates start at 0; 0 at the top left, the y axix goes "down" and the x axis goes to the "right", so if the robot is moving down, it's y coordinate will increase.

# The program will be an array of subprograms, containing at least one subprogram. Each subprogram is a list of actions, an action is a hash containing the following elements:

# action: the instruction to perform (see below for the possible instructions)
# if (optional): the color condition to perform the action (see "conditionals")
# Your simulator will run turn by turn, until the end of the game, popping an action from the stack and executing it.

# At the end of the game (see "end of the game" section), you will return a 2 elements array containg the final state of the board and the final state of the robot.

# Your function might need to abort prematurely if there is an error (see "end of the game")

# Instructions
# Your simulator will support the following instructions:

# forward: move the robot 1 cell forward, following it's current direction
# turn_right: turn the robot to the right
# turn_left: turn the robot to the left
# paint_blue: change the color of the current cell to blue
# paint_green: change the color of the current cell to green
# paint_red: change the color of the current cell to red
# an integer: stack the instructions of the subprogram at the integer's index in the given program
# Conditionals
# Actions can be conditional, meaning they will be executed only if the current cell is of the same color as their if element.

# If an action does not fulfil the conditional, it's skipped.

# The stack
# Your simulator will use a stack to store the instructions to execute. You will initialize it with the instructions of the first subprogram.

# The stack is Last-in, First-out, that means the last inserted instruction will be executed next.

# Each turn, you'll have to pop the most recently inserted action from the stack and execute it.

# Please note the subprogams are meant to be executed in the same order as given, so take care when putting their instructions on the stack.

# End of the game
# The game ends when the robot has collected all the stars on the board or if an error occurs.

# You have to take care of the following errors:

# There is no more instructions to execute on the stack
# The robot moved out of the board (either outside of the board array boudaries or on a nil cell)
# You have to raise an exception to signal it with a meaningful error message if any errors occurs.

#===============================================================================================================
#                                               Hints/Explanation
#===============================================================================================================

# 1. "an integer: stack the instructions of the subprogram at the integer's index in the given program"
# not very clearly described (at least to me), it means that performing an action with an integer as a value will complete the current subprogram and start that subprogram whose index in the array of programs is equal to this integer

# 2. Another subprogram is only run if there is an action with an integer value, the next  subprogram in the array should not run itself when the current one is finished

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Robozzle
  attr_reader :board, :x, :y, :direction

  def initialize(board, robot, program)
    @board = board
    @program = program
    @i = 0
    @x, @y = robot[:x], robot[:y]
    @direction = robot[:direction]
    @rdlu = [:right, :down, :left, :up]
    @stars = @board.flatten.compact.sum{|hh| hh[:star] ? 1 : 0}
  end

  def run
    until @stars == 0
      @program[@i].each do |action|
        if !action[:if] or action[:if] == @board[@y][@x][:color]
          if action[:action].class == Integer
            @i = action[:action]
            break
          else
            send action[:action]
            raise 'program[i] is empty' if @program[@i].size == 1
            break if @stars == 0
          end
        end
      end
    end
  end

  private

  def forward
    case @direction
    when :right then @x += 1
    when :down then @y += 1
    when :left then @x -= 1
    when :up then @y -= 1
    end
    if @board[@y][@x][:star]
      @stars -= 1
      @board[@y][@x][:star] = false
    end
  end

  def turn_right
    i = @rdlu.index(@direction)
    i == 3 ? @direction = @rdlu[0] : @direction = @rdlu[i+1]
  end

  def turn_left
    i = @rdlu.index(@direction)
    i == 0 ? @direction = @rdlu[3] : @direction = @rdlu[i-1]
  end

  def paint_blue; @board[@y][@x][:color] = :blue end
  def paint_green; @board[@y][@x][:color] = :green end
  def paint_red; @board[@y][@x][:color] = :red end
end

def robozzle(board, robot, program)
  rob = Robozzle.new(board, robot, program)
  rob.run
  [rob.board, {x: rob.x, y: rob.y, direction: rob.direction}]
end
