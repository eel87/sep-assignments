# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
		members.delete(person)
  end

  def front
		return members.first
  end

  def middle
		middle = ((members.length-1)/2).floor
		return members[middle]
  end

  def back
		return members.last
  end

  def search(person)
		if members.include?(person) === true
			return "#{person} is in position ##{members.index(person)} in line."
		else
				return "That person is not in line!"
		end
  end

  private

  def index(person)
		return members.index(person)
  end

end
