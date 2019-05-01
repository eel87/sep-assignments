include RSpec

require_relative 'node'
require_relative 'sixdegrees_data'

RSpec.describe Node, type: Class do
  let(:kevin_bacon) { Node.new('Kevin Bacon') }
  let(:michael_fassbender) { Node.new('Michael Fassbender') }
  let(:jennifer_lawrence) { Node.new('Jennifer Lawrence') }
  let(:ryan_gosling) { Node.new('Ryan Gosling') }
  let(:emma_stone) { Node.new('Emma Stone') }
  let(:morgan_freeman) { Node.new('Morgan Freeman') }
  let(:chris_pratt) { Node.new('Chris Pratt') }
  let(:harrison_ford) { Node.new('Harrison Ford') }
  let(:tommy_lee_jones) { Node.new('Tommy Lee Jones') }
  let(:zoe_saldana) { Node.new('Zoe Saldana') }
  let(:bradley_cooper) { Node.new('Bradley Cooper') }
  let(:chris_pine) { Node.new('Chris Pine') }
  let(:simon_pegg) { Node.new('Simon Pegg') }
  let(:tom_cruise) { Node.new('Tom Cruise') }
  let(:jeremy_renner) { Node.new('Jeremy Renner') }
  let(:amy_adams) { Node.new('Amy Adams') }
  let(:steve_carell) { Node.new('Steve Carell') }
  
  describe "#index" do
    it "creates a Node based on the name passed in" do
      expect(ryan_gosling.name).to eq "Ryan Gosling"
      expect(morgan_freeman.name).to eq "Morgan Freeman"
    end
    
    it "associates a Hash with the node" do
      emma_stone.film_actor_hash = {'Crazy, Stupid, Love' => [ryan_gosling, kevin_bacon]}
      emma_stone { is_expected.to have_attributes(:film_actor_hash) }
    end    
    
  end

end