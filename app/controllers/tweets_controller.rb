class TweetsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @tweets = @user.tweets.all.reverse
    @users = User.all
    @tweet = Tweet.new
  end

  def new
    @user = User.find(params[:user_id])
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
    @user = User.find(params[:user_id])
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
        respond_to do |format|
        format.html { redirect_to user_tweet_path(@tweet) }
        format.js
      end
    end
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to user_tweet_path(@tweet)
    else
      redirect_to :back, alert: "Try again, scumbag."
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to user_tweet_path, notice: "Tweet deleted, scumbag."
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content).merge(user_id: current_user.id)
  end

end
