# frozen_string_literal: true

describe Peep do
  describe 'when reading peeps' do
    it 'they should be shown in reverse chronological order' do
      Peep.create(message: 'Peep test message 1')
      Peep.create(message: 'Peep test message 2')
      Peep.create(message: 'Peep test message 3')
      visit('/')
      page.find('#peeps_container div:first-child', text: 'Peep test message 3')
      page.find('#peeps_container div:last-child', text: 'Peep test message 1')
    end

    it "they should each have a time stamp" do
      test_peep = Peep.create(message: 'Peep test message')
      visit('/')
      expect(first(".post")).to have_content(test_peep.time_posted.strftime("%A at %H:%M"))
    end
  end
end
