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
		middle = ((members.length)/2)
		return members[middle]
  end

  def back
		return members.last
  end

  def search(person)
		if members.include?(person) === true
			return person
			else
				return nil
		end
  end

  private

  def index(person)
		return members.index(person)
  end

end
