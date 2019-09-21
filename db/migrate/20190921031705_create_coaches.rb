class CreateCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :coaches do |t|
      t.string :name
      t.string :time_zone, default: "UTC"

      t.timestamps
    end
  end
end
