class AddLifeToSmiggles < ActiveRecord::Migration[5.1]
  def change
    add_column :smiggles, :life, :integer
  end
end
