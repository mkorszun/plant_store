class CreateKinds < ActiveRecord::Migration
  def change
    create_table :kinds do |t|
      t.text :name
      t.text :latin_name
      t.references :user, index: true

      t.timestamps
    end
  end
end
