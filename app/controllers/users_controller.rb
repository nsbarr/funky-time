require 'twilio-ruby'


class UsersController < ApplicationController
  
before_filter :authenticate, :except => [:show, :about, :contact, :new, :create, :index, :edit, :update]
  
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
      UserMailer.request_alert(@user).deliver
      #begin twilio bullshit
      #@number_to_call = User.phone
      #end twilio bullshit
      number_to_send_to = @user.phone
      theme = @user.prompt

       twilio_sid = "ACfff561dd3ac397a29183f7bf7d68e370"
       twilio_token = "cbb3471db9d83b61598159b5210404f1"
       twilio_phone_number = "6464900303"

       @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token

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
       poem = @user.bid
       @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
       @twilio_client.account.sms.messages.create(
         :from => "+1#{twilio_phone_number}",
         :to => number_to_send_to,
         :body => "#{poem}"
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

#
#class TwilioController < ApplicationController
#
#  def process_sms
#    @city = params[:FromCity].capitalize
#    @state = params[:FromState]
#    render 'process_sms.xml.erb', :content_type => 'text/xml'
#  end
#
#end