class AddKindRefToPlants < ActiveRecord::Migration
  def change
    add_reference :plants, :kind, index: true
  end
end
