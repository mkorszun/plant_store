module Api::KindsHelper

  def json_format_kind
    return :include => {
        :global_treatment => {
            :only => [
                :watering,
                :insolation,
                :temperature_min,
                :temperature_max,
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

