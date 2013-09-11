class NonNullConstraintForUserId < ActiveRecord::Migration
  def change
    change_column :plants, :user_id, :integer, :null => false
  end
end
