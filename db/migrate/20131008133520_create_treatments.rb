class CreateTreatments < ActiveRecord::Migration
  def change
    create_table :treatments do |t|
      t.integer :temperature_min
      t.integer :temperature_max
      t.text :comment
      t.references :kind, index: true

      t.timestamps
    end
  end
end
