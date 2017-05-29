class CreateSmiggles < ActiveRecord::Migration[5.1]
  def change
    create_table :smiggles do |t|
      t.integer :happiness
      t.integer :hunger
      t.integer :thirst
      t.integer :waste

      t.timestamps
    end
  end
end
