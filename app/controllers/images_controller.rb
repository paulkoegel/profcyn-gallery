class ImagesController < ApplicationController

  before_filter :init_dropbox_client

  #caches_page :show

  def index
    @location = Location.find_by_country(params[:location_id] || 'taiwan')
    @images = @location.images.limit(10)
    @large_image = @images.slice!(0)
  end

  def show
    #send_data @photo = @client.ls('galleries').first.ls.first.download, :type => 'image/jpeg', :disposition => 'inline'
  end

  def edit
  end

  def update
  end

  def create
    # POST params:
    # {"utf8"=>"✓", "authenticity_token"=>"MPcV4fAqshmx2/WcJO4FWah92Mp9kpWcrEdPGao8rSc=", "image"=>{"file"=>[#<ActionDispatch::Http::UploadedFile:0x007f9bd3313578 @original_filename="Frank424766_10150505770452687_668482686_9274392_249914352_n.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"image[file][]\"; filename=\"Frank424766_10150505770452687_668482686_9274392_249914352_n.jpg\"\r\nContent-Type: image/jpeg\r\n", @tempfile=#<File:/var/folders/tj/7gyp9lps2c163wl9nmwt0jrc0000gn/T/RackMultipart20120424-14985-8qhgcr>>, #<ActionDispatch::Http::UploadedFile:0x007f9bd33137d0 @original_filename="Fukushima-3D79.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"image[file][]\"; filename=\"Fukushima-3D79.jpg\"\r\nContent-Type: image/jpeg\r\n", @tempfile=#<File:/var/folders/tj/7gyp9lps2c163wl9nmwt0jrc0000gn/T/RackMultipart20120424-14985-4reozb>>]}, "commit"=>"Create Image"}
    params[:image][:files].each do |file|
      @client.upload file.original_filename, file.tempfile
    end
  end

  def new
  end

  def destroy
  end
end
