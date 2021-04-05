# frozen_string_literal: true

describe User do
  describe 'registration' do
    it 'can sign up' do
      register_test_user
      expect(page).to have_content 'Welcome, test@example.com'
    end
  end
end
