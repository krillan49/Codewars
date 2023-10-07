#===============================================================================================================
#                                               Description
#===============================================================================================================

# Magic The Gathering is a collectible card game that features wizards battling against each other with spells and creature summons. The game itself can be quite complicated to learn. In this series of katas, we'll be solving some of the situations that arise during gameplay. You won't need any prior knowledge of the game to solve these contrived problems, as I will provide you with enough information.
#
# In magic, spells utilize a stack. The last spell onto the stack, is generally the first one to be cast (LIFO - Last-In, First-Out). The spell stack was created to give players the chance to respond to a spell before it actually resolves and manifests itself in the game. Spells have 2 speeds, instant and sorcery. If a spell is of type instant, it can be cast at any time and in response to other spells. If a spell is a sorcery, it may only be cast if the stack is empty. Here are some examples:
#
# The stack is empty.
# Player 1 casts Lightning Bolt (instant).
# Stack -> ['Lightning Bolt']
# Player 2 casts Giant Growth (instant).
# Stack -> ['Lightning Bolt', 'Giant Growth']
# Both players agree that they are done casting spells.
# Giant Growth resolves.
# Stack -> ['Lightning Bolt']
# Lightning Bolt resolves.
# Stack -> []
# Create a method of the Magic object called spellStack() that when called without an argument returns and removes a spell from the stack in the correct order. When passed a spell object, the spell should be added to the stack and the length of the stack should be returned. Remember: A sorcery may only be cast when the stack is empty. An instant may be cast at any time. If a sorcery is being put on the stack when it's not empty, or if you're trying to cast a spell when the stack is empty, spellStack should throw an error. Spells will be passed as an object with the keys name and type:
#
# spellStack({'name' => 'Lightning Bolt', 'type' => 'instant'}) -> 1 # Adds lightning bolt to the stack and returns the length of the stack
# spellStack() -> {'name' => 'Lightning Bolt', 'type' => 'instant'}  # Removes lightning bolt from the stack and returns it

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Magic
  def initialize
    @stack = []
  end
  def spell_stack(spell=nil)
    if spell
      raise Error if spell['type'] == 'sorcery' && @stack.size > 0
      @stack << spell
      @stack.size
    else
      raise Error if @stack.empty?
      @stack.pop
    end
  end
end
