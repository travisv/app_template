class CreateHomevisits < ActiveRecord::Migration
  def change
    create_table :homevisits do |t|
      t.date :date_of_departure
      t.string :date_of_return
      t.references :client, index: true

      t.timestamps null: false
    end
    add_foreign_key :homevisits, :clients
  end
end
