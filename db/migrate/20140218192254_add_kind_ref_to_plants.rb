class AddKindRefToPlants < ActiveRecord::Migration
  def change
    add_reference :plants, :global_kind, index: true
  end
end
