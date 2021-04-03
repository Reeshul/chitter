require "./lib/peep"

describe Peep do

  describe "#new" do
    it "makes a new instance of a peep" do
      peep = Peep.new(id: 1, message: "Test peep")
      expect(peep).to be_instance_of Peep
      expect(peep.message).to eq "Test peep"
      expect(peep.id).to eq 1
    end
  end
  
  describe ".all" do
    it "returns an array of all the peeps" do
      Peep.create(message: "Peep test message 1")
      Peep.create(message: "Peep test message 2")
      Peep.create(message: "Peep test message 3")
      expect(Peep.all).to be_an(Array)
      expect(Peep.all.length).to eq 3
      expect(Peep.all.first.message).to eq("Peep test message 1")
    end
  end
  
  describe ".create" do
    it "returns a newly created peep" do
      created_peep = Peep.create(message: 'Peep test message')
      expect(created_peep).to be_a Peep
      expect(created_peep.message).to eq("Peep test message")
    end
  end
end