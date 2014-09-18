class UpdateFollowers < ActiveRecord::Migration
  def change
    rename_column :followers, :followers_user_id, :f_user_id
  end
end
