class YoutubesController < ApplicationController

def index
  @youtubes = Youtube.order('created_at DESC')
end

def new
  @youtube = Youtube.new
end
 
def create
  @youtube = Youtube.new youtube_params
  if @youtube.save
    flash[:success] = 'You tube added!'
    redirect_to youtubes_path
  else
    render 'new'
  end
end




private 

  def youtube_params
    params.require(:youtube).permit(:link)
  end

end