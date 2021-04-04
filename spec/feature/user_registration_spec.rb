# frozen_string_literal: true

describe User do
  describe 'registration' do
    it 'a user can register' do
      register_test_user
      expect(page).to have_content 'Welcome, test@example.com'
    end
  end
end
