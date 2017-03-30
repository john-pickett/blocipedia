class UserMailer < ApplicationMailer

  default from: "john.pickett@gmail.com"

  def new_user(user)
    @user = user
    mail(to: @user.email, subject: "You've registered at Blocipedia")
  end

end
