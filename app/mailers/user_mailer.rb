class UserMailer < ActionMailer::Base
  
  default :from => "bot@poems.io"
  
  def request_alert(user)
    @user = user
    @url = Rails.root.to_s + "/users/#{@user.id}/edit"
    mail(:to => "nsbarr@gmail.com", :subject => "Someone needs a poem!")
  end
end
