class AddColumnUsuariosToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :usuarios, :string
  end
end
