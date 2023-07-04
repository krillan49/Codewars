#===============================================================================================================
#                                               Description
#===============================================================================================================

# A famous casino is suddenly faced with a sharp decline of their revenues. They decide to offer Texas hold'em also online. Can you help them by writing an algorithm that can rank poker hands?
#
# Task
# Create a poker hand that has a method to compare itself to another poker hand:
#
# compare_with(other_hand)
# A poker hand has a constructor that accepts a string containing 5 cards:
#
# PokerHand.new("KS 2H 5C JD TD")
# The characteristics of the string of cards are:
#
# Each card consists of two characters, where
# The first character is the value of the card: 2, 3, 4, 5, 6, 7, 8, 9, T(en), J(ack), Q(ueen), K(ing), A(ce)
# The second character represents the suit: S(pades), H(earts), D(iamonds), C(lubs)
# A space is used as card separator between cards
# The result of your poker hand compare can be one of these 3 options:
#
# [ "Win", "Tie", "Loss" ]
# Notes
# Apply the Texas Hold'em rules for ranking the cards.
# Low aces are valid in this kata.
# There is no ranking for the suits.

#===============================================================================================================
#                                               Solution
#===============================================================================================================

class PokerHand
  VAL = {'2'=>2, '3'=>3, '4'=>4, '5'=>5, '6'=>6, '7'=>7, '8'=>8, '9'=>9, 'T'=>10, 'J'=>11, 'Q'=>12, 'K'=>13, 'A'=>14}

  def initialize(hand)
    @first = hand.split.map{|e| VAL[e[0]]}
    @suit = hand.split.map{|e| e[1]}.uniq.count == 1 ?  true : false
  end

  def compare_with(other)
    self_value, other_value = self.hand_value, other.hand_value
    self_value > other_value ? 'Win' : self_value < other_value ? 'Loss' : 'Tie'
  end

  def hand_value
    if @first.sort == (0..4).map{|n| @first.min + n} && @suit #'straight flush'
      @first.max * 6_776_064
    elsif number_of_same?(4) #'4 of a kind'  # 1_936_018 - 13_552_126
      select_same(4)[0] * 968009 + reject_same(4)[0] * 0.01
    elsif number_of_same?(3) && number_of_same?(2) #'full house' # 276575 - 1_936_017
      select_same(3)[0] * 138286 + select_same(2)[0]
    elsif @suit #'flush'  # 39510 - 276570
      @first.max * 19755 + singles_points(@first.min(4).reverse)
    elsif @first.sort == (0..4).map{|n| @first.min + n} #'straight'  # 5644 - 39508
      @first.max * 2822
    elsif number_of_same?(3) #'set'   # 806 - 5642
      select_same(3)[0] * 403 + singles_points(reject_same(3).max(2))
    elsif @first.uniq.size == 3 #'2 pair'  # 116 - 804
      select_same(2).max * 50 + select_same(2).min * 8 + reject_same(2)[0] * 0.01
    elsif @first.uniq.size == 4 #'1 pair'   # 16(2*8) - 112(14*8)
      select_same(2)[0] * 8 + singles_points(reject_same(2).max(3))
    else #'high card'  # max 14
      @first.max + singles_points(@first.min(4).reverse)
    end
  end

  private

  def number_of_same?(n)
    @first.any?{|e| @first.count(e) == n}
  end

  def select_same(n)
    @first.select{|e| @first.count(e) == n}
  end

  def reject_same(n)
    @first.reject{|e| @first.count(e) == n}
  end

  def singles_points(single_cards)
    single_cards.map.with_index(2){|e, i| e * 0.1**i}.sum
  end
end
