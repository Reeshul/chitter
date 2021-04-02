# frozen_string_literal: true

feature 'when posting a peep' do
  scenario 'it should appear on the page' do
    visit('/')
    fill_in('post_peep', with: 'Test peep.')
    click_button('Post')
    expect(page).to have_content('Test peep.')
  end
end
