class AddColumnDatetime < ActiveRecord::Migration
  def change
    add_column :agendas, :start_at, :datetime
    add_column :agendas, :end_at, :datetime
  end
end
