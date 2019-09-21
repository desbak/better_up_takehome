class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :coach_id
      t.integer :availability_block_id
      t.date :date
      t.string :client_name

      t.timestamps
    end

    add_index :appointments, :coach_id
    add_index :appointments, :availability_block_id
  end
end
