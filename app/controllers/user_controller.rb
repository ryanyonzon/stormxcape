class UserController < ApplicationController

  layout "standard-layout"

  def index
    if cookies[:is_admin] == nil
      login
      render_action 'login'
    else
      redirect_to :controller => 'message', :action => 'index'
    end
  end
 
  def login
    case request.method
      when :post
      if session[:user] = User.authenticate(params[:login_username], params[:login_password])

        flash[:notice]  = "Login successful"
        cookies[:is_admin] = "yes"
        
        #flash.now['notice']  = "Login successful"        
        #redirect_back_or_default :controller => "main/general", :action => "index"
  
        redirect_to :controller => "project", :action => "lists"

      else
        flash.now['notice']  = "Login unsuccessful! Try again!"
        #@login = params[:user_username]
      end
    end
  end
  
  def logout
    session[:user] = nil
    cookies.delete :is_admin
  end

end
