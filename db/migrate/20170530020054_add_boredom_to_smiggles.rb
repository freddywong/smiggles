class AddBoredomToSmiggles < ActiveRecord::Migration[5.1]
  def change
    add_column :smiggles, :boredom, :integer
  end
end
