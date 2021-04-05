# frozen_string_literal: true

require_relative '../test_helpers'

describe Peep do
  context 'when logged in' do
    describe 'posting a peep' do
      it 'appears on the page' do
        create_test_user
        sign_in_as_test_user
        fill_in('post_peep', with: 'Test peep.')
        click_button('Post')
        expect(page).to have_content('Test peep.')
      end
    end
  end

  context 'when not logged in' do
    describe 'posting a peep' do
      it 'notifies user to regiser or log in' do
        visit('/')
        fill_in('post_peep', with: 'Test peep.')
        click_button('Post')
        expect(page).to have_content('Please register or log in to peep')
      end
    end
  end
end
