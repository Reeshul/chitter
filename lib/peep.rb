# frozen_string_literal: true

require 'pg'

class Peep
  attr_reader :id, :message, :time_posted

  def initialize(id:, message:, time_posted:)
    @id = id
    @message = message
    @time_posted = time_posted
  end

  def self.all
    result = connect_to_db.exec('SELECT * FROM peeps ORDER BY id desc;')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_posted: Time.parse(peep['time_posted']))
    end
  end

  def self.create(message:)
    result = connect_to_db.exec("INSERT INTO peeps (message) VALUES ('#{message}') RETURNING id, message, time_posted;")
    Peep.new(id: result.first['id'], message: result.first['message'],
             time_posted: Time.parse(result.first['time_posted']))
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
