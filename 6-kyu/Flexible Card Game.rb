#===============================================================================================================
#                                               Description
#===============================================================================================================

# Create any card game!
# Create a Card Game library of classes which could be used to create any number of basic card games. You'll need at least a Deck class and a Card class.
#
# Deck functionality
# A deck has a public attribute:
#
# cards: array of remaining cards in the deck.
#
# ...and three public methods:
#
# count(): count of remaining cards in the deck.
#
# shuffle(): randomize the order of the remaining cards in the deck.
#
# draw(n): remove the last n cards from the deck and return them in an array.
#
# Upon initialization, a deck is filled with 52 cards (13 from each of 4 suits).
#
# Card functionality
# A card has these public attributes:
#
# suit: a symbol representing the suit of the card.
#
# rank: an integer from 1 to 13. ("ace" is 1, "king" is 13)
#
# Javascript: face_card: is this card a face card? (> 10)
#
# ...and these methods:
#
# Ruby: face_card?: is this card a face card? (> 10)
#
# to_s (JS:toString()) : human-readable string representation of the card (e.g. "Ace of Spades", "10 of Clubs", "Queen of Hearts")
#
# Cards must be Comparable to other cards. Compare the ranks of the cards only.
#
# Since this is a low level layer to build card games above, all test input will be valid. All ranks will be between 1 and 13 and all suits will be one of
#
# Ruby: :hearts, :diamonds, :spades, :clubs
# Javascript: Card.HEARTS, Card.DIAMONDS, Card.CLUBS, Card.SPADES

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class Card
  attr_accessor :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end
  def face_card?
    @rank >= 11
  end
  def <=>(obj)
    self.rank <=> obj.rank
  end
  def >(obj)
    self.rank > obj.rank
  end
  def <(obj)
    self.rank < obj.rank
  end
  def ==(obj)
    self.rank == obj.rank
  end
  def to_s
    case @rank
    when 1
      "Ace of #{suit.to_s.capitalize}"
    when 13
      "King of #{suit.to_s.capitalize}"
    when 12
      "Queen of #{suit.to_s.capitalize}"
    when 11
      "Jack of #{suit.to_s.capitalize}"
    else
      "#{@rank} of #{suit.to_s.capitalize}"
    end
  end
end

class Deck
  attr_accessor :cards
  def initialize
    @cards=[]
    [:hearts, :diamonds, :spades, :clubs].each do |suit|
      1.upto(13) do |rank|
        @cards << Card.new(suit, rank)
      end
    end
  end
  def shuffle
    @cards.shuffle!
  end
  def draw(n=1)
    @cards.pop(n)
  end
  def count
    @cards.count
  end
end
