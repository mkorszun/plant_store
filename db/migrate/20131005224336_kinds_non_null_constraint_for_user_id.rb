class KindsNonNullConstraintForUserId < ActiveRecord::Migration
  def change
    change_column :kinds, :user_id, :integer, :null => false
  end
end
