class RemoveLifeFromSmiggles < ActiveRecord::Migration[5.1]
  def change
    remove_column :smiggles, :life
  end
end
