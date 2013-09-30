class CommentController < ApplicationController

 layout 'main'
  
  def new
    @newcomment = Comment.new(params[:addcomment])    
    
    if request.post? and @newcomment.save
      #flash[:success] = 'Your message was successfully created & posted.'
      redirect_to :controller => 'message', :action => 'lists'
    end      
  end
  
end
