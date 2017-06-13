class AddUserIdToSmiggles < ActiveRecord::Migration[5.1]
  def change
    add_column :smiggles, :user_id, :integer
  end
end
