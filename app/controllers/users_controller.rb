class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end
  
  def userlog
    @user = User.all
  end
    
  def new
    @user = User.new
  end
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = %Q[Thanks, I'll be texting you soon!]
     redirect_to @user
    else
      render 'new'
    end
  end
end
