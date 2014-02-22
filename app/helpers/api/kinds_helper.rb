module Api::KindsHelper

  def json_format_kind
    return :include => {
        :global_treatment => {
            :only => [
                :watering_season,
                :watering_rest,
                :dry_between_watering_season,
                :dry_between_watering_rest,
                :insolation,
                :season_temp_min,
                :season_temp_max,
                :rest_temp_min,
                :rest_temp_max,
                :humidity,
                :comment
            ]}},
        :only => [
            :id,
            :name,
            :latin_name
        ]
  end

end

