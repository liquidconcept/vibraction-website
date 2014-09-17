class RemoveFieldDate < ActiveRecord::Migration
  def change
    remove_column :agendas, :date
  end
end
