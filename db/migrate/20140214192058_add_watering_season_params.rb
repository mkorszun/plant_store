class AddWateringSeasonParams < ActiveRecord::Migration
  def change
    add_column :global_treatments, :watering_season, :string
    add_column :global_treatments, :watering_rest, :string
  end
end
