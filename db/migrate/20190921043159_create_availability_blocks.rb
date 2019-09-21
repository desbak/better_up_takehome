class CreateAvailabilityBlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :availability_blocks do |t|
      t.integer :coach_id
      t.string :day
      t.time :start_time  # local tz of coach
      t.time :end_time    # local tz of coach

      t.timestamps
    end

    add_index :availability_blocks, :coach_id
  end
end
