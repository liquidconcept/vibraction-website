class CreateTableAgenda < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.string :name
      t.integer :number
      t.integer :group
      t.date :date
      t.time :time_start
      t.time :time_end
    end
  end
end
