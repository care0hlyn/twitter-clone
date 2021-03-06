class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @users = User.all
    @tweets = @user.tweets.all.reverse
    @tweet = Tweet.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      session[:user_id] = @user.id
      redirect_to user_tweets_path(@user), notice: "Thanks, scumbag."
    else
      redirect_to :back, alert: "Try again, scumbag."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      redirect_to :back, alert: "Try again, scumbag."
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Bye bye, scumbag."
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password_confirmation, :password)
  end

end
