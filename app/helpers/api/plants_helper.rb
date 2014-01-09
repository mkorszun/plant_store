module Api::PlantsHelper
  def json_format
    return :include => {
        :global_kind => {
            :include => {
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
                :name,
                :latin_name
            ]}},
        :only => [
            :name,
            :description
        ]
  end
end

