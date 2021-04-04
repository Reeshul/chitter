# frozen_string_literal: true

require_relative '../test_helpers'

describe User do
  describe 'authentication' do
    before do
      create_test_user
    end

    it 'a user can log in' do
      sign_in_as_test_user
      expect(page).to have_content 'Welcome, test@example.com'
    end

    it 'a user sees an error if they get their email wrong' do
      sign_in_with_different_email
      expect(page).to have_content 'Please check your email or password.'
    end

    it 'a user sees an error if they get their password wrong' do
      sign_in_with_different_password
      expect(page).to have_content 'Please check your email or password.'
    end

    it 'a user can log out' do
      sign_in_as_test_user
      log_out
      expect(page).to have_content 'You have signed out.'
    end
  end
end
