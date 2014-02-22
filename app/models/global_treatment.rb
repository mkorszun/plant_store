class GlobalTreatment < ActiveRecord::Base

  belongs_to :global_kind

  classy_enum_attr :insolation
  classy_enum_attr :watering
  classy_enum_attr :humidity

  classy_enum_attr :watering_season, enum: 'Watering'
  classy_enum_attr :watering_rest, enum: 'Watering'

end
