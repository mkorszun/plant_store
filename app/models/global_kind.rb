class GlobalKind < ActiveRecord::Base

  has_many :plant

  has_one :global_treatment
  accepts_nested_attributes_for :global_treatment

end
