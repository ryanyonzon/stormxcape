class ProjectController < ApplicationController

  layout "nofckeditor"

  def lists
    @projects = Project.find(:all)  
  end

  def view
    @projectview = Project.find(@params[:id])
    @projecttodo = Todo.find(:all, :conditions => ['project_id = ? AND finished <> 1', @params[:id]], :order => "created_on desc")
    @sharedfiles = Fileshare.find(:all, :conditions => ['project_id = ?', @params[:id]], :order => "created_on desc")
    #@whosproject = User.find(:all, :conditions => ['id = 1'])
  end
  
  def new
    @newproject = Project.new(params[:newproject])    
    
    if request.post? and @newproject.save
      #flash[:success] = 'Your message was successfully created & posted.'
      redirect_to :action => 'lists'
    end      
  end
  
  def edit
    @editproject = Project.find(@params[:id])
  end
  
  def update
    @project = Project.find(@params[:id])
    @project.update_attribute(:name, params[:newproject]['name'])
    redirect_to :action => 'lists'    
  end
  
  def destroy
    Project.find(@params[:id]).destroy
    redirect_to :action => 'lists'
  end

end
