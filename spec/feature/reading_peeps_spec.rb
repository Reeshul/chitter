# frozen_string_literal: true

describe Peep do
  describe 'when reading peeps' do
    it 'they should be shown in reverse chronological order' do
      described_class.create(message: 'Peep test message 1')
      described_class.create(message: 'Peep test message 2')
      described_class.create(message: 'Peep test message 3')
      visit('/')
      page.find('#peeps_container div:first-child', text: 'Peep test message 3')
      page.find('#peeps_container div:last-child', text: 'Peep test message 1')
    end
  end
end
