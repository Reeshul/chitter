# frozen_string_literal: true

require 'pg'

p 'Setting up test database...'

def setup_test_database
  # Connect to test database
  connection = PG.connect(dbname: 'chitter_test')
  # Clear the tables
  connection.exec('TRUNCATE peeps, users;')
end
