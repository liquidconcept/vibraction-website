class ChangeTimeType < ActiveRecord::Migration
  def change
    rename_column :agendas, :strat_at, :start_at
  end
end
