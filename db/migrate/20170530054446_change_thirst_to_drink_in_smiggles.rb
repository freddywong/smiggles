class ChangeThirstToDrinkInSmiggles < ActiveRecord::Migration[5.1]
  def change
    rename_column :smiggles, :thirst, :drink
  end
end
