class MessageController < ApplicationController

 layout "main"
  
  def index
    if cookies[:is_admin] == nil
      redirect_to :controller => 'user', :action => 'login'
    else
      lists
      render_action 'lists'
    end
  end
  
  def lists
    # save user info in session
    @messages = Message.find(:all, :order => "updated_on desc")
  end
  
  def new
    @newmessage = Message.new(params[:postmessage])    
    
    if request.post? and @newmessage.save
      #flash[:success] = 'Your message was successfully created & posted.'
      redirect_to :action => 'lists'
    end      
  end
  
  def edit
    @editmessage = Message.find(@params[:id])
  end
  
  def update
    @pmessage = Message.find(@params[:id])
    @pmessage.update_attribute(:postmessage, params[:postmessage]['postmessage'])
    redirect_to :action => 'lists'    
  end
  
  def destroy
    Message.find(@params[:id]).destroy
    redirect_to :action => 'lists'
  end

end
