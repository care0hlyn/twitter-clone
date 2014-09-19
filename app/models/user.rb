class User < ActiveRecord::Base
  has_secure_password
  validates :name, :presence => true
  validates_uniqueness_of :email
  validates :password, :presence => { :on => :create }
  validates :password_confirmation, :presence => { :on => :create }

  has_many :tweets
  has_many :follows
  has_many :followers, through: :follows
  has_many :stalkings, class_name: "Follow", foreign_key: "follower_id"
  has_many :followed_users, through: :stalkings, :source => :user
  has_many :followed_tweets, through: :followed_users, :source => :tweets
end
