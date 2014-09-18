class Follow < ActiveRecord::Base
  validates :user_id, presence: true
  validates :follower_id, :presence => { :on => :create }

  belongs_to :user
  belongs_to :follower, class_name: "User"
end
