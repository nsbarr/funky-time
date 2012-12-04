require 'twilio-ruby'


class UsersController < ApplicationController
  
before_filter :authenticate, :except => [:show, :about, :contact, :new, :create, :index, :update]
  
  def show
    @user = User.find(params[:id])
  end
  
  def userlog
    
    @user = User.all
  end
  
  def about
  end
  
  def contact
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      
      #Sends an email out when a user is created
      #UserMailer.request_alert(@user).deliver
      
      #Set up the Twilio stuff
      twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
      twilio_token = "cbb3471db9d83b61598159b5210404f1"
      twilio_phone_number = "6464900303"
      number_to_send_to = @user.phone
      theme = @user.prompt
      id = @user.id
      url = "http://poems.io/users/#{id}/edit"
      #Rolls the dice to select a poet
      poet_to_send_to = ["9143934990","4782277137"].sample
      
      #Sends the request to the poet 
      
       @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

       @twilio_client.account.sms.messages.create(
         :from => "+1#{twilio_phone_number}",
         :to => poet_to_send_to,
         :body => "Oh hey, won't you write someone a poem about #{theme}? You can do it here: #{url}"
       )
      
      
      #Sends a confirmation SMS to the user
       @twilio_client.account.sms.messages.create(
         :from => "+1#{twilio_phone_number}",
         :to => number_to_send_to,
         :body => "Thanks, I'm dreaming up your poem about #{theme}"
       )
# noflash      flash[:success] = %Q[Thanks, I'll be texting you soon!]
     redirect_to @user
    else
      render 'new'
    end
  end
  
  def index
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    number_to_send_to = @user.phone
    theme = @user.prompt
    twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
    twilio_token = "cbb3471db9d83b61598159b5210404f1"
    twilio_phone_number = "6464900303"
    
    if @user.update_attributes(params[:user])
       poem_text = @user.bid
       @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
       @twilio_client.account.sms.messages.create(
         :from => "+1#{twilio_phone_number}",
         :to => number_to_send_to,
         :body => "#{poem_text}"
       )    
       redirect_to "/foo"    
    else
      render 'edit'
    end
  end

    protected

    def authenticate
      authenticate_or_request_with_http_basic do |username, password|
        username == "foo" && password == "bar"
      end
    end

end