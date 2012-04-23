class ImagesController < ApplicationController

  before_filter :init_dropbox_client

  def index
    @images = Image.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def create
    # POST params:
    # {"utf8"=>"✓", "authenticity_token"=>"BpXiqpB5mgud3jb73MBPw5jeiVA3qvVTg7a6Z7DLflg=", "image"=>{"file"=>#<ActionDispatch::Http::UploadedFile:0x007ff35c61c180 @original_filename="Bud Bad.jpg", @content_type="image/jpeg", @headers="Content-Disposition: form-data; name=\"image[file]\"; filename=\"Bud Bad.jpg\"\r\nContent-Type: image/jpeg\r\n", @tempfile=#<File:/var/folders/tj/7gyp9lps2c163wl9nmwt0jrc0000gn/T/RackMultipart20120424-14324-d6x4rr>>}, "commit"=>"Create Image"}
    @client.upload params[:image][:file].original_filename, params[:image][:file].tempfile
  end

  def new
  end

  def destroy
  end
end
