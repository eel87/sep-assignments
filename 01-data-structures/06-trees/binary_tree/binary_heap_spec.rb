include RSpec

require_relative 'binary_heap'

RSpec.describe BinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { BinaryHeap.new(root) }
  
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:matrix) { Node.new("The Matrix", 87) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a left child" do
      tree.insert(pacific_rim)
      expect(tree.heap[2].title).to eq "The Matrix"
    end
    
    it "properly inserts a new node as a right child" do
      tree.insert(braveheart)
      tree.insert(jedi)
      expect(tree.heap[3].title).to eq "Star Wars: Return of the Jedi"
    end
    
    it "properly inserts a new node as a left-left child" do
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      expect(tree.heap[4].title).to eq "The Matrix"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      expect(tree.heap[5].title).to eq "Inception"
    end

    it "properly inserts a new node as a right-left child" do
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(matrix)
      expect(tree.heap[6].title).to eq "The Matrix"
    end

    it "properly inserts a new node as a right-right child" do
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(matrix)
      tree.insert(mad_max_2)
      expect(tree.heap[7].title).to eq "Mad Max 2: The Road Warrior"
    end

    it "swaps the parent and child node if parent node is greater" do
      tree.insert(braveheart)
      tree.sort
      expect(tree.root.title).to eq "Braveheart"
      expect(tree.heap[2].title).to eq "The Matrix"
    end
    
    it "correctly heapifies the array" do
      tree.insert(braveheart)
      tree.insert(district)
      tree.sort
      expect(tree.root.title).to eq "Braveheart"
      expect(tree.heap[2].title).to eq "The Matrix"
      expect(tree.heap[3].title).to eq "District 9"
    end
    
    it "correctly heapifies the array" do
      tree.insert(braveheart)
      tree.insert(district)
      tree.sort
      expect(tree.root.title).to eq "Braveheart"
      expect(tree.heap[2].title).to eq "The Matrix"
      expect(tree.heap[3].title).to eq "District 9"
    end
    
    it "correctly heapifies the array" do
      tree.insert(braveheart)
      tree.insert(jedi)
      tree.insert(donnie)
      tree.insert(inception)
      tree.insert(matrix)
      tree.insert(mad_max_2)
      tree.insert(shawshank)
      tree.insert(martian)
      expect(tree.root.title).to eq "Braveheart"
      expect(tree.heap[2].title).to eq "Donnie Darko"
      expect(tree.heap[3].title).to eq "Star Wars: Return of the Jedi"
      expect(tree.heap[4].title).to eq "The Matrix"
      expect(tree.heap[5].title).to eq "Inception"
      expect(tree.heap[6].title).to eq "The Matrix"
      expect(tree.heap[7].title).to eq "Mad Max 2: The Road Warrior"
      expect(tree.heap[8].title).to eq "The Shawshank Redemption"
      expect(tree.heap[9].title).to eq "The Martian"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      tree.insert(empire)
      tree.insert(mad_max_2)
      expect(tree.find( nil)).to eq nil
    end

    it "properly finds a left node" do
      tree.insert(pacific_rim)
      expect(tree.find(matrix.title)).to eq "The Matrix"
    end

    it "properly finds a left-left node" do
      tree.insert(braveheart)
      tree.insert(pacific_rim)
      expect(tree.find(pacific_rim.title)).to eq "Pacific Rim"
    end

    it "properly finds a left-right node" do
      tree.insert( donnie)
      tree.insert( inception)
      expect(tree.find(inception.title)).to eq "Inception"
    end

    it "properly finds a right node" do
      tree.insert( district)
      expect(tree.find(district.title)).to eq "District 9"
    end

    it "properly finds a right-left node" do
      tree.insert( hope)
      tree.insert( martian)
      expect(tree.find(martian.title)).to eq "The Martian"
    end

    it "properly finds a right-right node" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      expect(tree.find(mad_max_2.title)).to eq "Mad Max 2: The Road Warrior"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(tree.delete( nil)).to eq nil
    end

    it "properly deletes a left node" do
      tree.insert( hope)
      tree.delete( hope.title)
      expect(tree.find( hope.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      tree.insert( braveheart)
      tree.insert( pacific_rim)
      tree.delete( pacific_rim.title)
      expect(tree.find( pacific_rim.title)).to be_nil
    end

    it "properly deletes a left-right node" do
      tree.insert( donnie)
      tree.insert( inception)
      tree.delete( inception.title)
      expect(tree.find( inception.title)).to be_nil
    end

    it "properly deletes a right node" do
      tree.insert( district)
      tree.delete( district.title)
      expect(tree.find( district.title)).to be_nil
    end

    it "properly deletes a right-left node" do
      tree.insert( hope)
      tree.insert( martian)
      tree.delete( martian.title)
      expect(tree.find( martian.title)).to be_nil
    end

    it "properly deletes a right-right node" do
      tree.insert( empire)
      tree.insert( mad_max_2)
      tree.delete( mad_max_2.title)
      expect(tree.find( mad_max_2.title)).to be_nil
    end
  end

  describe "#print" do
    specify {
      expected_output = "Pacific Rim, 72\nBraveheart, 78\nStar Wars: Return of the Jedi, 80\nThe Matrix, 87\nDistrict 9, 90\nStar Wars: The Empire Strikes Back, 94\nInception, 86\nStar Wars: A New Hope, 93\nThe Shawshank Redemption, 91\nThe Martian, 92\nMad Max 2: The Road Warrior, 98\n"
      tree.insert( hope)
      tree.insert( empire)
      tree.insert( jedi)
      tree.insert( martian)
      tree.insert( pacific_rim)
      tree.insert( inception)
      tree.insert( braveheart)
      tree.insert( shawshank)
      tree.insert( district)
      tree.insert( mad_max_2)
      expect { tree.print }.to output(expected_output).to_stdout
    }

    # specify {
    #   expected_output = "The Matrix, 87\nBraveheart, 78\nMad Max 2, The Road Warrior: 98\nPacific Rim: 72\nInception: 86\nDistrict 9: 90\nStar Wars: Return of the Jedi: 80\nThe Shawshank Redemption: 91\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
    #   tree.insert( mad_max_2)
    #   tree.insert( district)
    #   tree.insert( shawshank)
    #   tree.insert( braveheart)
    #   tree.insert( inception)
    #   tree.insert( pacific_rim)
    #   tree.insert( martian)
    #   tree.insert( jedi)
    #   tree.insert( empire)
    #   tree.insert( hope)
    #   expect { tree.print }.to output(expected_output).to_stdout
    # }
  end
end
