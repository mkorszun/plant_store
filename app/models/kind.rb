class Kind < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :presence => true
  validates :user, :presence => true

  has_many :plant, dependent: :destroy

  has_one :treatment, :dependent => :destroy
  accepts_nested_attributes_for :treatment, :allow_destroy => true
end
