class Plant < ActiveRecord::Base
  belongs_to :user
  belongs_to :kind
  validates :user_id, :presence => true
  validates :user, :presence => true
  validates :kind_id, :presence => true
  validates :kind, :presence => true
end
