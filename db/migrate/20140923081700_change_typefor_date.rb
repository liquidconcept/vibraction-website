class ChangeTypeforDate < ActiveRecord::Migration
  def change
    remove_column :agendas, :start_at, :time
    remove_column :agendas, :end_at, :time
  end
end
