class AddWateringDryParams < ActiveRecord::Migration
  def change
    add_column :global_treatments, :dry_between_watering_season, :boolean
    add_column :global_treatments, :dry_between_watering_rest, :boolean
  end
end
