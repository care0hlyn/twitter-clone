class UserMailer < ActionMailer::Base
  default from: "scumbagtwitter@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.signup_confirmation.subject
  #
  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Sign Up Confirmation"
  end

  def follow_notification(user, follower_user)
    @user = user
    @follower_user = follower_user

    mail to: user.email, subject: "New Follower!"
  end
end
