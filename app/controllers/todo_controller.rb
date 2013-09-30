class TodoController < ApplicationController

 layout "nofckeditor"

  def new
    @user = User.find(:all)
    @newpost = Todo.new(params[:postmessage])    
    
    if request.post? and @newpost.save
      #flash[:success] = 'Your message was successfully created & posted.'
      redirect_to :controller => 'project', :action => 'view', :id => @params[:id]
    end  
  end    
  
  def done
    @finishtask = Todo.find(@params[:id])
    @finishtask.update_attributes("finished" => 1, "finished_user_id" => @session[:user]['id'])
    redirect_to :controller => 'project', :action => 'view', :id => @params[:project]    
  end
  
end
