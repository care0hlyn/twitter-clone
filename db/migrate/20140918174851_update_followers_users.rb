class UpdateFollowersUsers < ActiveRecord::Migration
  def change
    rename_table :followers_users, :follows

    rename_column :follows, :f_user_id, :follower_id
  end
end
