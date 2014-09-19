class Follow < ActiveRecord::Base
  validates :user_id, presence: true
  validates :follower_id, :presence => { :on => :create }
  validates_uniqueness_of :user_id

  belongs_to :user
  belongs_to :follower, class_name: "User"
end
