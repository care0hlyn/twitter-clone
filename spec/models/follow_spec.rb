describe Follow do
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :follower_id }

  it { should belong_to :user }
  it { should belong_to :follower }
end
