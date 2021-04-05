# frozen_string_literal: true

require_relative '../test_helpers'

describe User do
  describe 'authentication' do
    before do
      create_test_user
    end

    it 'can log in' do
      sign_in_as_test_user
      expect(page).to have_content 'Welcome, test@example.com'
    end

    it 'can log out' do
      sign_in_as_test_user
      log_out
      expect(page).to have_content 'You have signed out.'
    end

    it 'shows alert if wrong email is entered' do
      sign_in_with_different_email
      expect(page).to have_content 'Please check your email or password.'
    end

    it 'shows alert if wrong password is entered' do
      sign_in_with_different_password
      expect(page).to have_content 'Please check your email or password.'
    end
  end
end
