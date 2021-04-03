# frozen_string_literal: true

describe Peep do
  describe 'when posting a peep' do
    it 'appears on the page' do
      visit('/')
      fill_in('post_peep', with: 'Test peep.')
      click_button('Post')
      expect(page).to have_content('Test peep.')
    end
  end
end
