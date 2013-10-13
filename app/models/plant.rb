class Plant < ActiveRecord::Base

  belongs_to :user
  validates :user_id, :presence => true

  belongs_to :global_kind
  validates :global_kind_id, :presence => true

end
