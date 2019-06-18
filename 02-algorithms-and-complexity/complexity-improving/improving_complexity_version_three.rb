class HashSort

  def initialize
    @hash = Hash.new
  end
  
  def insert_multiple(*arrays)
    @collection = *arrays.concat.flatten
    @collection.each_with_index do |item, index|
      @hash[index] = item
    end
  end
  
  def sort
    n = @collection.length - 1
      begin 
      swapped = false
        n.times do |index|
          next if @hash[index] == nil
          if @hash[index].to_i > @hash[index + 1].to_i
            temp = @hash[index]
            @hash[index] = @hash[index + 1]
            @hash[index + 1] = temp
            swapped = true
          end
        end
      end until not swapped
    @hash.values
  end

end

h = HashSort.new
h.insert_multiple([0,9,8,7],[8,4,7,3],[2,8,1,4,9])
print h.sort