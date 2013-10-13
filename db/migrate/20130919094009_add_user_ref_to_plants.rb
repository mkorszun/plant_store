class AddUserRefToPlants < ActiveRecord::Migration
  def change
    add_reference :plants, :user, :null => false, index: true
  end
end
