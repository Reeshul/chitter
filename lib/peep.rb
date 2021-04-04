# frozen_string_literal: true

require 'pg'

class Peep
  attr_reader :id, :message, :time_posted, :user_email

  def initialize(id:, message:, time_posted:, user_email:)
    @id = id
    @message = message
    @time_posted = time_posted
    @user_email = user_email
  end

  def self.all
    result = connect_to_db.exec('SELECT * FROM peeps ORDER BY id desc;')
    result.map do |peep|
      Peep.new(id: peep['id'], message: peep['message'], time_posted: Time.parse(peep['time_posted']),
               user_email: peep['user_email'])
    end
  end

  def self.create(message:, user_email:)
    result = connect_to_db.exec("INSERT INTO peeps (message, user_email) VALUES ('#{message}', '#{user_email}') RETURNING id, message, time_posted, user_email;")
    Peep.new(id: result.first['id'], message: result.first['message'],
             time_posted: Time.parse(result.first['time_posted']), user_email: result.first['user_email'])
  end

  def self.connect_to_db
    if ENV['ENVIRONMENT'] == 'test'
      PG.connect(dbname: 'chitter_test')
    else
      PG.connect(dbname: 'chitter')
    end
  end
end
