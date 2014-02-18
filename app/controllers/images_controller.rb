class ImagesController < ApplicationController
  def index

    @images = Dir.glob("public/img/*")
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    image = params[:image]
    name = params[:name]

    message = Image.get_message name
    respond_to do |format|
      if Image.save_photo image, name
        flash[:notice]= message
        format.html { redirect_to action: 'index' }
      end
    end
  end

end
