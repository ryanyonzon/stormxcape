class FileshareController < ApplicationController

 layout "nofckeditor"

  def new
    # do nothing
  end

  def upload

    @newfile = Fileshare.new(params[:form])
    
      file_field = @params['form']['filename'] rescue nil    

    @newfile['filename'] = file_field.full_original_filename
    @newfile['path'] = "files/" + DateTime.now.strftime("%m%d%y")
    
    if request.post? and @newfile.save
      #flash[:success] = 'Your message was successfully created & posted.'

      path = @newfile['path']
      
      FileUtils.mkdir_p path
      
      file_name = @params['form']['filename'] rescue nil    

      File.open("#{path}/#{file_field.full_original_filename}", "wb") { |f| f.write(@params['form']['filename'].read) }
      
      redirect_to :controller => 'project', :action => 'view', :id => @params[:id]
      
    end      


  end

end
