# frozen_string_literal: true

require 'pg'

class Peep
  attr_reader :id, :message

  def initialize(id:, message:)
    @id = id
    @message = message
  end

  def self.all
    result = connect_to_db.exec('SELECT * FROM peeps ORDER BY id desc;')
    result.map do |post|
      Peep.new(id: post['id'], message: post['message'])
    end
  end

  def self.create(message:)
    result = connect_to_db.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message;")
    Peep.new(id: result.first['id'], message: result.first['message'])
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
