class CreateGlobalKinds < ActiveRecord::Migration
  def change
    create_table :global_kinds do |t|
      t.string :name
      t.string :latin_name

      t.timestamps
    end
  end
end
