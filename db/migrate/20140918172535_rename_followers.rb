class RenameFollowers < ActiveRecord::Migration
  def change
    rename_table :followers, :followers_users
  end
end
