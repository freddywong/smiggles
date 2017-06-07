class CreateLives < ActiveRecord::Migration[5.1]
  def change
    create_table :lives do |t|
      t.integer :amount
      t.datetime :died
      t.belongs_to :smiggle

      t.timestamps
    end
  end
end
