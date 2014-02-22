class AddSeasonTemperatureParams < ActiveRecord::Migration
  def change
    add_column :global_treatments, :season_temp_min, :integer
    add_column :global_treatments, :season_temp_max, :integer
    add_column :global_treatments, :rest_temp_min, :integer
    add_column :global_treatments, :rest_temp_max, :integer
  end
end
