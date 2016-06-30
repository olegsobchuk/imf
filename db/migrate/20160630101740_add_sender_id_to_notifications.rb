class AddSenderIdToNotifications < ActiveRecord::Migration[5.0]
  def up
    add_column :notifications, :sender_id, :integer
    remove_index :notifications,  column: :user_id
    rename_column :notifications, :user_id, :receiver_id
    add_index :notifications, [:receiver_id, :sender_id]
  end

  def down
    remove_index :notifications, column: [:receiver_id, :sender_id]
    remove_column :notifications, :sender_id
    rename_column :notifications, :receiver_id, :user_id
    add_index :notifications, :user_id
  end
end
