# frozen_string_literal: true

describe User do
  describe 'registration' do
    it 'a user can register' do
      visit('/users/new')
      fill_in('email', with: 'test@example.com')
      fill_in('password', with: 'password123')
      click_button('Register')
      expect(page).to have_content 'Welcome, test@example.com'
    end
  end
end
