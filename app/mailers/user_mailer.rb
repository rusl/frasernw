class UserMailer < ActionMailer::Base
  default from: "frasernw@gmail.com", bcc: "kalinh@gmail.com"
  
  def welcome_admin(user)
    @user = user
    mail(:to => user.email, :subject => "[frasernw] you now have admin rights at frasernw.heroku.com")
  end
  
end
