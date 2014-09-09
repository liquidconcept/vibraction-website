class Agenda < ActiveRecord::Base
  require 'csv'

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      agenda_hash = row.to_hash

      Agenda.create!(agenda_hash)
    end
  end
end
