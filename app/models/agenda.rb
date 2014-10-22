class Agenda < ActiveRecord::Base
  require 'csv'

  # corresponding CSV column name for each album attribute
  CSV_COLUMNS = {
    name: 'Nom',
    identifier: 'Identifiant',
    group: 'Groupe',
    session: 'Session',
    start_at: ['Date', 'Debut'],
    end_at: ['Date', 'Fin'],
    full: 'Plein',
    destroy: 'Effacer'
  }.freeze

  scope :by_identifier, ->(identifier) { where("identifier = ?", identifier) }

  def self.date_of_course(identifier)
    Agenda.by_identifier(identifier).group_by(&:group)
  end

  def self.import(file)
    @errors = {}

    CSV.new(file.read, headers: true).each do |row|
      begin
        agenda = Agenda.where({
          identifier: row[CSV_COLUMNS[:identifier]],
          group: row[CSV_COLUMNS[:group]],
          session: row[CSV_COLUMNS[:session]]
        }).first
        agenda ||= Agenda.new

        if row[CSV_COLUMNS[:destroy]].to_s.strip.upcase == 'EFFACER'
          agenda.destroy unless agenda.new_record?
          next
        end

        Agenda.transaction do
          CSV_COLUMNS.each do |attribute, column_key|
            case attribute
            when :start_at, :end_at
              datetime = DateTime.parse("#{row[column_key.first]} #{row[column_key.last]}")
              agenda[attribute] = datetime
            when :full
              agenda[attribute] = row[column_key] == 'oui'
            else
              agenda[attribute] = row[column_key] if agenda.has_attribute?(attribute)
            end
          end

          agenda.save!
        end
      rescue ActiveRecord::RecordInvalid
        agenda_errors = [agenda.name, agenda.session]
        @errors[agenda_errors] = agenda.errors
      end
    end
  end
end
