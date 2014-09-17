class ChangeTime < ActiveRecord::Migration
  def change
    rename_column :agendas, :time_start, :strat_at
    rename_column :agendas, :time_end, :end_at
  end
end
