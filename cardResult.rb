require 'rspec'

class CardResult

  attr_accessor :hand

  def initialize
    @hand = []
  end

  # def highCard
  #     result =""
  #     #highest number
  #     x= [1,4,3,2,5]
  #     y =[6,3,2,1,4]
  #     x=x.sort.reverse
  #     y=y.sort.reverse
  #
  #
  #
  #     (0..x.length-1).each do |i|
  #
  #       if x[i].to_i > y[i].to_i
  #         puts x[i]
  #       else
  #         puts y[i]
  #       end

  #finds a straight flush
  def straightFlush(x, y)
    x = x.sort.reverse
    if (straight(x) == true && flush(y) == true)
      true
    else
      false
    end
  end

  #finds a straight
  def straight(x)

    x = x.sort.reverse

    (0..x.length - 2).each do |i|
      if (x[i] - 1) != (x[i + 1])
        return false
      end
    end
    true
  end

  #finds a flush
  def flush(x)

    if (x[0] == x[1] && x[0] == x[2] && x[0] == x[3] && x[0] == x[4])
      true
    else
      false
    end
  end

  #finds four of a kind
  def fourOfAKind(x)

    x = x.sort
    count = 1

    (0..x.length - 2).each do |i|
      if x[i] == x[i + 1]

        count += 1
        if count == 4
          return true
        end

      elsif x[i] != x[i + 1]
        count = 1
      end
    end
    false
  end

#finds a full house
def fullHouse(x)

  x = x.sort
  count1 = 1
  count2 = 1

  (0..x.length - 2).each do |i|
    if x[i] == x[i + 1] && count1 != 3
      count1 += 1

    elsif (x[i] == x[i + 1]) && (count1 == 2 || count1 == 3)
      count2 += 1
    end
  end

  if (count1 == 3 && count2 == 2) || (count1 == 2 && count2 == 3)
    true
  else
    false
  end
end

#finds a three of a kind
def threeOfAKind(x)

  x = x.sort
  count = 1

  (0..x.length - 2).each do |i|
    if x[i] == x[i + 1]

      count += 1
      if count == 3
        return true
      end

    elsif x[i] != x[i + 1]
      count = 1
    end
  end
  false
end

#finds two pairs
def twoPairs(x)

  x = x.sort
  count1 = 1
  count2 = 1

  (0..x.length - 2).each do |i|
    if x[i] == x[i + 1] && count1 != 2
      count1 += 1

    elsif x[i] == x[i + 1] && count1 == 2
      count2 += 1
    end
  end

  if count1 == 2 && count2 == 2
    true
  else
    false
  end
end

#finds a pair
def twoOfAKind(x)

  x = x.sort
  count = 1

  (0..x.length - 2).each do |i|
    if x[i] == x[i + 1]
      count = count + 1
    end
  end
  if count == 2
    true
  else
    false
  end
end

def highCard()
  true
end

#finds the card result
def findCardResult(x, y)
  result = ""
  if (straightFlush(x, y) == true)
    result = "Straight Flush"
  elsif (fourOfAKind(x) == true)
    result = "Four of a Kind"
  elsif (fullHouse(x) == true)
    result = "Full House"
  elsif (flush(y) == true)
    result = "Flush"
  elsif (straight(x) == true)
    result = "Straight"
  elsif (threeOfAKind(x) == true)
    result = "Three of a Kind"
  elsif (twoPairs(x) == true)
    result = "Two Pairs"
  elsif (twoOfAKind(x) == true)
    result = "Pair"
  elsif (highCard() == true)
    result = "High Card"

  end

end

result = CardResult.new
result.threeOfAKind([2, 2, 3, 2, 5])

end

describe "check card hands" do
  result = CardResult.new
  #   it 'Checking High Card' do
  #     expect(deck.highCard(b[],w[]),"White wins with a high card")
  #   end
  it 'Checking for Straight' do
    expect(result.straight([1, 2, 3, 4, 5])).to be true
  end
  it 'Checking for Flush' do
    expect(result.flush(%w[H H H H H])).to be true
  end
  it 'Checking for Straight Flush' do
    expect(result.straightFlush([1, 2, 3, 4, 5], x = %w[H H H H H])).to be true
  end
  it 'Checking for 4 of a Kind' do
    expect(result.fourOfAKind([4, 4, 4, 4, 1])).to be true
  end
  it 'Checking for a full house' do
    expect(result.fullHouse([5, 5, 5, 2, 2])).to be true
  end
  it 'Checking for a 3 of a kind' do
    expect(result.threeOfAKind([4, 5, 4, 6, 4])).to be true
  end
  it 'Checking for two pairs' do
    expect(result.twoPairs([3, 2, 2, 1, 1])).to be true
  end
  it 'Checking for a two of a kind' do
    expect(result.twoOfAKind([4, 5, 7, 6, 4])).to be true
  end
  it 'Checking for a high card' do
    expect(result.highCard()).to be true
  end
  it 'Checking result of a result of hand for a Pair' do
    expect(result.findCardResult([6, 6, 2, 3, 4], %w[H,D,S,S,C])).to eq("Pair")
  end
  it 'Checking result of a result of hand for a Straight' do
    expect(result.findCardResult([1, 5, 3, 2, 4], %w[H,D,S,S,C])).to eq("Straight")
  end
  it 'Checking result of a result of hand for a Full House' do
    expect(result.findCardResult([6, 6, 2, 2, 6], %w[H,D,S,S,C])).to eq("Full House")
  end
  it 'Checking result of a result of hand for a Flush' do
    expect(result.findCardResult([6, 4, 2, 2, 6], ["H", "H", "H", "H", "H"])).to eq("Flush")
  end
  it 'Checking result of a result of hand for a Straight Flush' do
    expect(result.findCardResult([1, 2, 3, 4, 5], ["H", "H", "H", "H", "H"])).to eq("Straight Flush")
  end
  it 'Checking result of a result of hand for a four of a kind' do
    expect(result.findCardResult([3, 2, 3, 3, 3], ["H", "H", "H", "H", "S"])).to eq("Four of a Kind")
  end
  it 'Checking result of a result of hand for a three if a kind' do
    expect(result.findCardResult([3, 2, 4, 3, 3], ["H", "H", "H", "H", "S"])).to eq("Three of a Kind")
  end
  it 'Checking result of a result of hand for two pairs' do
    expect(result.findCardResult([3, 2, 4, 2, 3], ["H", "H", "H", "H", "S"])).to eq("Two Pairs")
  end
  it 'Checking result of a result of hand for a pair ' do
    expect(result.findCardResult([1, 2, 4, 2, 3], ["H", "H", "H", "H", "S"])).to eq("Pair")
  end
  it 'Checking result of a result of hand for a high card ' do
    expect(result.findCardResult([1, 2, 4, 7, 3], ["H", "H", "H", "H", "S"])).to eq("High Card")
  end

end



