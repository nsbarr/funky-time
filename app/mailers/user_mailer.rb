class UserMailer < ActionMailer::Base
  
  default :from => "nsbarr@gmail.com"
  
  def request_alert(user)
    @user = user
    @url = "/users/#{@user.id}/edit"
    mail(:to => "nsbarr@gmail.com", :subject => "Someone needs a poem!")
  end
end
