class Agenda < ActiveRecord::Base
  require 'csv'

  scope :group_scope, ->(group) { where("agendas.group = ?", group) }
  scope :futur_time, where("date > CURRENT_TIMESTAMP")

  def self.import(file)
    CSV.foreach(file.path, headers: true) do |row|
      agenda_hash = row.to_hash

      Agenda.create!(agenda_hash)
    end
  end

  def self.groups
    Agenda.pluck(:group).uniq
  end
end
