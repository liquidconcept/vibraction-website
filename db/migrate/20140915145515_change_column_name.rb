class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :agendas, :number, :identifier
    add_column :agendas, :session, :integer
    add_column :agendas, :full, :boolean
  end
end
