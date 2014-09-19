class FollowsController < ApplicationController

  def index
    @user = User.all
    @stalkings = @user.stalkings.all
    @follwed_users = @user.followed_users.all
  end

  def new
    @user = User.find(params[:user_id])
    @follow = Follow.new
  end

  def create
    @user = User.find(params[:user_id])
    @follow = Follow.new(user_id: @user.id, follower_id: current_user.id)
    @follower_user = User.find(current_user.id)
    if @follow.save
        UserMailer.follow_notification(@user, @follower_user).deliver
        respond_to do |format|
        format.html { redirect_to :back }
        format.js
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to user_follows_path(@user), notice: "Unfollowed, scumbag."
  end

end
