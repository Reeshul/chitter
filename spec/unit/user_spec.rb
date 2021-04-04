# frozen_string_literal: true

require_relative '../test_helpers'

describe User do
  let(:user_instance) { described_class.new(id: 1, email: 'user@example.com') }

  describe '#new' do
    it 'makes a new instance of a user' do
      expect(user_instance).to be_instance_of described_class
    end

    it '.email returns the user email' do
      expect(user_instance.email).to eq 'user@example.com'
    end

    it '.id returns the user id' do
      expect(user_instance.id).to eq 1
    end
  end

  describe '.create' do
    it 'creates a new user' do
      user = described_class.create(email: 'test@example.com', password: 'password123')
      persisted_data = persisted_data(table: :users, id: user.id)
      expect(user.id).to eq persisted_data.first['id']
    end

    it 'hashes the users password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('password123')
      described_class.create(email: 'test@example.com', password: 'password123')
    end
  end

  describe '.find' do
    it 'finds a user by ID' do
      user = described_class.create(email: 'test@example.com', password: 'password123')
      result = described_class.find(id: user.id)
      expect(result.id).to eq user.id
    end

    it 'returns nil if there is no ID given' do
      expect(described_class.find(id: nil)).to eq nil
    end
  end
end
