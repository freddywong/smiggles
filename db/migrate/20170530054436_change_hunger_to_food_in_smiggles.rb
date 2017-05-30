class ChangeHungerToFoodInSmiggles < ActiveRecord::Migration[5.1]
  def change
    rename_column :smiggles, :hunger, :food
  end
end
