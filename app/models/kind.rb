class Kind < ActiveRecord::Base
  belongs_to :user
  has_many :plant, dependent: :destroy
  validates :user_id, :presence => true
  validates :user, :presence => true
end
