# frozen_string_literal: true

describe Peep do
  describe 'when reading peeps' do
    it 'they should be shown in reverse chronological order' do
      described_class.create(message: 'Peep test message 1', user_email: 'test@example.com')
      described_class.create(message: 'Peep test message 2', user_email: 'test@example.com')
      described_class.create(message: 'Peep test message 3', user_email: 'test@example.com')
      visit('/')
      page.find('#peeps_container div:first-child', text: 'Peep test message 3')
      page.find('#peeps_container div:last-child', text: 'Peep test message 1')
    end

    it 'they should each have a time stamp' do
      test_peep = described_class.create(message: 'Peep test message', user_email: 'test@example.com')
      visit('/')
      expect(first('.post')).to have_content("posted at #{test_peep.time_posted.strftime('%H:%M on %a, %m %b')}")
    end

    it 'they should each show who it was posted by' do
      test_peep = described_class.create(message: 'Peep test message', user_email: 'test@example.com')
      visit('/')
      expect(first('.post')).to have_content("by #{test_peep.user_email}")
    end
  end
end
