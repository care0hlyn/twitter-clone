class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    create_table :tweets do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end

    create_table :followers do |t|
      t.integer :user_id
      t.integer :followers_user_id
    end
  end
end
