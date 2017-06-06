class RemoveBoredomFromSmiggles < ActiveRecord::Migration[5.1]
  def change
    remove_column :smiggles, :boredom
  end
end
