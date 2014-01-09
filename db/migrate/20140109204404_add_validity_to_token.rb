class AddValidityToToken < ActiveRecord::Migration
  def change
    add_column :tokens, :validity, :datetime
  end
end
