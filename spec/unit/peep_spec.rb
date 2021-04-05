# frozen_string_literal: true

require 'date'
require './lib/peep'

describe Peep do
  let(:peep) do
    described_class.new(id: 1, message: 'Test peep', time_posted: DateTime.now, user_email: 'test@example.com')
  end

  describe '#new' do
    it 'makes a new instance of a peep' do
      expect(peep).to be_instance_of described_class
    end

    it '.message returns the peep message' do
      expect(peep.message).to eq 'Test peep'
    end

    it '.id returns the peep id' do
      expect(peep.id).to eq 1
    end
  end

  describe '.all' do
    before do
      described_class.create(message: 'Peep test message 1', user_email: 'test@example.com')
      described_class.create(message: 'Peep test message 2', user_email: 'test@example.com')
      described_class.create(message: 'Peep test message 3', user_email: 'test@example.com')
    end

    it 'returns an array of all the peeps' do
      expect(described_class.all).to be_an(Array)
    end

    it 'size of the array of peeps is equal to the number of peeps' do
      expect(described_class.all.length).to eq 3
    end

    it 'first peep created is the last item in the array of peeps' do
      expect(described_class.all.first.message).to eq('Peep test message 3')
    end
  end

  describe '.create' do
    it 'creates a new peep' do
      created_peep = described_class.create(message: 'Peep test message', user_email: 'test@example.com')
      persisted_data = persisted_data(table: :peeps, id: created_peep.id)
      expect(created_peep.id).to eq persisted_data.first['id']
    end

    it 'returns a newly created peep' do
      created_peep = described_class.create(message: 'Peep test message', user_email: 'test@example.com')
      expect(created_peep.message).to eq('Peep test message')
    end
  end
end
