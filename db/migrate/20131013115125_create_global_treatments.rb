class CreateGlobalTreatments < ActiveRecord::Migration
  def change
    create_table :global_treatments do |t|
      t.string :watering
      t.string :insolation
      t.integer :temperature_min
      t.integer :temperature_max
      t.string :humidity
      t.text :comment
      t.references :global_kind, index: true

      t.timestamps
    end
  end
end
